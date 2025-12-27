# FitFlow - Project Guidelines for Claude

## Project Overview
This is a modern Flutter fitness app with offline-first architecture, custom workout workflows, and Supabase backend.

### Design System
- **Theme**: Modern dark fitness theme
- **Primary Color**: Orange (`#FF6B35` / `Color(0xFFFF6B35)`)
- **Secondary Color**: White with 0.7 opacity
- **Background**: Dark gradient (deep charcoal to black)
- **Accent**: Vibrant orange for CTAs and highlights
- **Typography**: Bold headers, clean body text
- **Style**: Energetic, motivating, performance-focused

## Tech Stack Rules

### State Management
- **ALWAYS use flutter_bloc** for state management
- Use Cubit for simple state, Bloc for complex event-driven logic
- States MUST extend Equatable or use Freezed
- NEVER use setState for business logic
- Repository → Bloc/Cubit → UI (clean architecture)

### Backend & Database
- **ALWAYS use Supabase** for all backend operations
- Database: PostgreSQL via Supabase client
- Auth: Supabase Auth (email, OAuth, magic links)
- Storage: Supabase Storage for images/videos
- Real-time: Supabase Realtime for live updates
- NEVER write raw SQL queries - use Supabase client methods
- ALWAYS handle offline scenarios gracefully

### Code Generation
- **ALWAYS use Freezed** for data models and states
- **ALWAYS use json_serializable** for JSON serialization
- Run `flutter pub run build_runner build --delete-conflicting-outputs` after creating models
- NEVER manually write copyWith, toJson, fromJson, == operators

### Dependency Injection
- **ALWAYS use get_it** for dependency injection
- Register dependencies in a separate `injection_container.dart` file
- Use factory for new instances, lazySingleton for shared instances
- NEVER use global variables or singletons outside get_it

### Routing
- **ALWAYS use go_router** for navigation
- Define routes in a central router configuration
- Use named routes, NEVER use direct constructors in navigation
- Support deep linking for all major features

### Networking (for external APIs, not Supabase)
- **ALWAYS use dio** for HTTP requests
- Use pretty_dio_logger in debug mode only
- Handle errors with Either<Failure, T> pattern from dartz
- Create API clients as services, inject via get_it

## Project Architecture

### Folder Structure
```
lib/
├── core/
│   ├── constants/          # App constants, colors, strings
│   ├── errors/             # Error classes, failures
│   ├── network/            # Network info, API clients
│   ├── theme/              # App theme configuration
│   ├── utils/              # Utility functions, extensions
│   └── widgets/            # Reusable widgets
├── features/
│   └── [feature_name]/
│       ├── data/
│       │   ├── datasources/    # Remote & local data sources
│       │   ├── models/         # Data models (Freezed + JSON)
│       │   └── repositories/   # Repository implementations
│       ├── domain/
│       │   ├── entities/       # Business entities (Freezed)
│       │   ├── repositories/   # Repository interfaces
│       │   └── usecases/       # Business logic use cases
│       └── presentation/
│           ├── bloc/           # Blocs/Cubits
│           ├── pages/          # Page widgets
│           └── widgets/        # Feature-specific widgets
├── injection_container.dart    # Dependency injection setup
├── router.dart                 # Go router configuration
└── main.dart
```

### Layer Responsibilities
- **Data Layer**: Supabase communication, data models, caching
- **Domain Layer**: Business entities, repository contracts, use cases
- **Presentation Layer**: UI, Blocs/Cubits, user interactions

### Clean Architecture Principles
- ALWAYS depend on abstractions, not implementations
- Data models (JSON) in data layer, entities in domain layer
- Use cases should have single responsibility
- Presentation layer NEVER imports data layer directly
- ALWAYS use repositories as the boundary between layers

## Code Patterns

### Models & Entities
```dart
// Domain entity
@freezed
class Workout with _$Workout {
  const factory Workout({
    required String id,
    required String name,
    required DateTime date,
    required List<Exercise> exercises,
  }) = _Workout;
}

// Data model (extends entity, adds JSON)
@freezed
class WorkoutModel with _$WorkoutModel {
  const factory WorkoutModel({
    required String id,
    required String name,
    required DateTime date,
    required List<ExerciseModel> exercises,
  }) = _WorkoutModel;

  factory WorkoutModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutModelFromJson(json);
}
```

### Bloc/Cubit States
```dart
@freezed
class WorkoutState with _$WorkoutState {
  const factory WorkoutState.initial() = _Initial;
  const factory WorkoutState.loading() = _Loading;
  const factory WorkoutState.loaded(List<Workout> workouts) = _Loaded;
  const factory WorkoutState.error(String message) = _Error;
}
```

### Repository Pattern
```dart
// Domain repository (interface)
abstract class WorkoutRepository {
  Future<Either<Failure, List<Workout>>> getWorkouts();
  Future<Either<Failure, Workout>> createWorkout(Workout workout);
}

// Data repository (implementation with Supabase)
class WorkoutRepositoryImpl implements WorkoutRepository {
  final SupabaseClient supabase;

  @override
  Future<Either<Failure, List<Workout>>> getWorkouts() async {
    try {
      final data = await supabase.from('workouts').select();
      return Right(data.map((e) => WorkoutModel.fromJson(e).toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
```

### Supabase Usage
```dart
// GOOD - Use Supabase client
final data = await supabase.from('workouts').select();
await supabase.from('workouts').insert(workout.toJson());

// GOOD - Handle offline
try {
  final data = await supabase.from('workouts').select();
} on PostgrestException catch (e) {
  // Handle Supabase error
} on SocketException catch (e) {
  // Handle offline scenario
}

// BAD - Don't use raw SQL
await supabase.rpc('SELECT * FROM workouts'); // ❌
```

## Theme & Design System

### Color Palette
```dart
class AppColors {
  // Primary Colors
  static const primary = Color(0xFFFF6B35);        // Vibrant Orange
  static const primaryDark = Color(0xFFE55A2B);    // Darker Orange
  static const primaryLight = Color(0xFFFF8C61);   // Lighter Orange

  // Background Colors
  static const background = Color(0xFF0D0D0D);     // Deep Black
  static const backgroundLight = Color(0xFF1A1A1A); // Charcoal
  static const surface = Color(0xFF262626);         // Card/Surface

  // Text Colors
  static const textPrimary = Color(0xFFFFFFFF);    // Pure White
  static const textSecondary = Color(0xB3FFFFFF);  // White 70% opacity
  static const textTertiary = Color(0x80FFFFFF);   // White 50% opacity

  // Functional Colors
  static const success = Color(0xFF4CAF50);        // Green
  static const error = Color(0xFFE53935);          // Red
  static const warning = Color(0xFFFFA726);        // Amber
  static const info = Color(0xFF29B6F6);           // Blue

  // Accent Colors
  static const accent1 = Color(0xFFFF6B35);        // Orange (primary)
  static const accent2 = Color(0xFF00D9FF);        // Cyan
  static const gradient1 = [Color(0xFF0D0D0D), Color(0xFF1A1A1A)];
  static const gradient2 = [Color(0xFFFF6B35), Color(0xFFE55A2B)];
}
```

### Typography
```dart
class AppTextStyles {
  // Headers
  static const h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static const h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.3,
  );

  static const h3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Body Text
  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textTertiary,
    height: 1.4,
  );

  // Special
  static const button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0.5,
  );

  static const stat = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    fontFeatures: [FontFeature.tabularFigures()],
  );
}
```

### UI Component Guidelines

#### Buttons
```dart
// Primary Button - Orange with white text
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 0,
  ),
  child: Text('START WORKOUT', style: AppTextStyles.button),
);

// Secondary Button - Outlined with orange
OutlinedButton(
  style: OutlinedButton.styleFrom(
    foregroundColor: AppColors.primary,
    side: BorderSide(color: AppColors.primary, width: 2),
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  child: Text('VIEW HISTORY', style: AppTextStyles.button),
);
```

#### Cards
```dart
Container(
  decoration: BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: AppColors.primary.withOpacity(0.2)),
    boxShadow: [
      BoxShadow(
        color: AppColors.primary.withOpacity(0.1),
        blurRadius: 20,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: // Card content
);
```

#### Progress Indicators
```dart
// Linear Progress
LinearProgressIndicator(
  value: 0.7,
  backgroundColor: AppColors.backgroundLight,
  valueColor: AlwaysStoppedAnimation(AppColors.primary),
  minHeight: 8,
  borderRadius: BorderRadius.circular(4),
);

// Circular Progress with Glow
Stack(
  alignment: Alignment.center,
  children: [
    Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.5),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
    ),
    SizedBox(
      width: 120,
      height: 120,
      child: CircularProgressIndicator(
        value: 0.7,
        strokeWidth: 8,
        backgroundColor: AppColors.backgroundLight,
        valueColor: AlwaysStoppedAnimation(AppColors.primary),
      ),
    ),
  ],
);
```

#### Input Fields
```dart
TextField(
  style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textPrimary),
  decoration: InputDecoration(
    filled: true,
    fillColor: AppColors.surface,
    hintText: 'Enter workout name',
    hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.textTertiary),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.backgroundLight),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.primary, width: 2),
    ),
    prefixIcon: Icon(Icons.fitness_center, color: AppColors.primary),
  ),
);
```

### Design Patterns

#### Glassmorphism Effect
```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.05),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.white.withOpacity(0.1)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
      ),
    ],
  ),
  child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    child: // Content
  ),
);
```

#### Gradient Backgrounds
```dart
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: AppColors.gradient1,
    ),
  ),
);

// Orange Accent Gradient
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: AppColors.gradient2,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(16),
  ),
);
```

#### Stat Display
```dart
Column(
  children: [
    Text('150', style: AppTextStyles.stat),
    SizedBox(height: 4),
    Text('WORKOUTS', style: AppTextStyles.bodySmall),
  ],
);
```

### Animation Guidelines
- Use subtle animations (200-300ms duration)
- Fade + Scale for button presses
- Slide animations for page transitions
- Pulse effect for active workout timer
- Smooth color transitions for state changes

### Spacing System
```dart
class AppSpacing {
  static const xxs = 4.0;
  static const xs = 8.0;
  static const sm = 12.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
  static const xxl = 48.0;
}
```

### Border Radius
```dart
class AppRadius {
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const full = 9999.0; // Pill shape
}
```

## Naming Conventions

### Files & Folders
- `snake_case` for all file names
- Feature folders: `workout`, `exercise`, `profile`
- Bloc files: `workout_bloc.dart`, `workout_event.dart`, `workout_state.dart`
- Model files: `workout_model.dart`
- Repository files: `workout_repository.dart`

### Classes & Methods
- `PascalCase` for classes: `WorkoutBloc`, `WorkoutRepository`
- `camelCase` for methods and variables: `getWorkouts()`, `workoutList`
- Prefix private with `_`: `_privateMethod()`

### Blocs & Cubits
- Name: `[Feature][Purpose]Bloc` or `[Feature][Purpose]Cubit`
- Examples: `WorkoutBloc`, `AuthCubit`, `ProfileBloc`
- Events: `[Feature][Action]` → `WorkoutStarted`, `WorkoutCreated`
- States: `[Feature][Status]` → `WorkoutLoading`, `WorkoutLoaded`

## Best Practices

### Error Handling
- ALWAYS use Either<Failure, T> from dartz for repository returns
- Create specific Failure classes: `ServerFailure`, `CacheFailure`, `NetworkFailure`
- Display user-friendly error messages in UI
- Log errors for debugging

### Performance
- Use `const` constructors wherever possible
- Implement list builders for long lists
- Cache Supabase queries when appropriate
- Use Supabase real-time subscriptions for live data

### Testing
- Write unit tests for use cases and repositories
- Write widget tests for reusable widgets
- Write bloc tests for all blocs/cubits
- Mock Supabase client in tests

### Code Quality
- ALWAYS run `flutter analyze` before committing
- Fix all lint warnings from flutter_lints
- Use meaningful variable names
- Add comments for complex business logic
- Keep methods small and focused (< 20 lines)

## Supabase-Specific Rules

### Authentication
```dart
// Sign up
await supabase.auth.signUp(email: email, password: password);

// Sign in
await supabase.auth.signInWithPassword(email: email, password: password);

// Auth state
supabase.auth.onAuthStateChange.listen((data) {
  final session = data.session;
  final user = data.session?.user;
});
```

### Database Operations
```dart
// Query
final workouts = await supabase
  .from('workouts')
  .select('*, exercises(*)')
  .eq('user_id', userId)
  .order('date', ascending: false);

// Insert
await supabase.from('workouts').insert(workout.toJson());

// Update
await supabase.from('workouts').update({'name': 'New Name'}).eq('id', id);

// Delete
await supabase.from('workouts').delete().eq('id', id);

// Real-time
supabase
  .from('workouts')
  .stream(primaryKey: ['id'])
  .eq('user_id', userId)
  .listen((data) { /* handle updates */ });
```

### Storage
```dart
// Upload image
final path = await supabase.storage
  .from('workout-images')
  .upload('user/$userId/$filename', file);

// Get public URL
final url = supabase.storage
  .from('workout-images')
  .getPublicUrl('user/$userId/$filename');
```

## Development Workflow

1. Create feature branch from main
2. Implement following clean architecture
3. Run `build_runner` if using code generation
4. Write tests
5. Run `flutter analyze`
6. Test on device/emulator
7. Create pull request

## Don't Do This ❌

- ❌ NEVER use setState for business logic
- ❌ NEVER put business logic in widgets
- ❌ NEVER use global variables
- ❌ NEVER ignore errors or use empty catch blocks
- ❌ NEVER commit commented-out code
- ❌ NEVER hardcode API keys or secrets
- ❌ NEVER use print() for logging (use logger package if needed)
- ❌ NEVER create God classes (> 300 lines)
- ❌ NEVER use dynamic types unless absolutely necessary
- ❌ NEVER ignore lint warnings

## Always Do This ✅

- ✅ ALWAYS follow clean architecture
- ✅ ALWAYS use dependency injection
- ✅ ALWAYS handle errors gracefully
- ✅ ALWAYS write testable code
- ✅ ALWAYS use const constructors
- ✅ ALWAYS add meaningful comments
- ✅ ALWAYS validate user input
- ✅ ALWAYS handle offline scenarios
- ✅ ALWAYS use type-safe code
- ✅ ALWAYS follow Flutter best practices
- ✅ ALWAYS use AppColors constants (never hardcode colors)
- ✅ ALWAYS use AppTextStyles for text styling
- ✅ ALWAYS apply dark theme with orange accents
- ✅ ALWAYS use white with 0.7 opacity for secondary text
- ✅ ALWAYS add subtle orange glow to important elements