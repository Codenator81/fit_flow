# FitFlow - Project Guidelines for Claude

## Project Overview
This is a modern Flutter fitness app with offline-first architecture, custom workout workflows, and Firebase backend.

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
- **ALWAYS use Firebase** for all backend operations
- Database: Cloud Firestore with automatic offline persistence
- Auth: Firebase Auth (email, Google, Apple, etc.)
- Storage: Firebase Storage for images/videos
- Real-time: Firestore real-time listeners for live updates
- NEVER write raw queries - use Firestore SDK methods
- Firestore handles offline caching automatically - no separate local DB needed
- ALWAYS enable Firestore offline persistence in initialization

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

### Networking (for external APIs, not Firebase)
- **ALWAYS use dio** for HTTP requests to third-party APIs
- Use pretty_dio_logger in debug mode only
- Handle errors with Either<Failure, T> pattern from dartz
- Create API clients as services, inject via get_it
- Firebase SDK handles its own network layer - don't use dio for Firebase operations

### UI Enhancements
- **ALWAYS use google_fonts** for custom typography
- **ALWAYS use flutter_animate** for smooth animations
- **ALWAYS use fl_chart** for progress graphs and analytics
- Apply animations to enhance user experience, not distract
- Use charts to visualize workout progress and stats

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
- **Data Layer**: Firebase/Firestore communication, data models, offline caching
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

// Data repository (implementation with Firestore)
class WorkoutRepositoryImpl implements WorkoutRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  @override
  Future<Either<Failure, List<Workout>>> getWorkouts() async {
    try {
      final userId = auth.currentUser?.uid;
      if (userId == null) return Left(AuthFailure('Not authenticated'));

      final snapshot = await firestore
          .collection('workouts')
          .where('userId', isEqualTo: userId)
          .orderBy('date', descending: true)
          .get();

      final workouts = snapshot.docs
          .map((doc) => WorkoutModel.fromJson(doc.data()).toEntity())
          .toList();

      return Right(workouts);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
```

### Firestore Usage
```dart
// GOOD - Use Firestore SDK
final snapshot = await firestore.collection('workouts').get();
await firestore.collection('workouts').add(workout.toJson());

// GOOD - Real-time listener
firestore.collection('workouts').snapshots().listen((snapshot) {
  // Handle updates
});

// GOOD - Query with filters
await firestore
    .collection('workouts')
    .where('userId', isEqualTo: userId)
    .where('date', isGreaterThan: startDate)
    .orderBy('date', descending: true)
    .limit(10)
    .get();

// GOOD - Offline persistence (works automatically)
// Firestore caches data and serves from cache when offline
// No special handling needed - it just works!

// BAD - Don't access Firestore directly from UI
firestore.collection('workouts').get(); // ❌ Use repository instead
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

### Typography (using Google Fonts)
```dart
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Headers - Using Montserrat (bold, modern)
  static TextStyle h1 = GoogleFonts.montserrat(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static TextStyle h2 = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.3,
  );

  static TextStyle h3 = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Body Text - Using Roboto (clean, readable)
  static TextStyle bodyLarge = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static TextStyle bodyMedium = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static TextStyle bodySmall = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textTertiary,
    height: 1.4,
  );

  // Special
  static TextStyle button = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0.5,
  );

  static TextStyle stat = GoogleFonts.bebasNeue(
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

### Animation Guidelines (using flutter_animate)

#### Basic Animations
```dart
import 'package:flutter_animate/flutter_animate.dart';

// Fade In + Slide Up
Text('Welcome')
  .animate()
  .fadeIn(duration: 300.ms)
  .slideY(begin: 0.2, end: 0);

// Scale on Tap (Button Press)
ElevatedButton(
  child: Text('START WORKOUT'),
)
  .animate(onPlay: (controller) => controller.repeat(reverse: true))
  .scale(duration: 200.ms, begin: Offset(1, 1), end: Offset(0.95, 0.95));

// Shimmer Effect (Loading)
Container()
  .animate(onPlay: (controller) => controller.repeat())
  .shimmer(duration: 1500.ms, color: AppColors.primary.withOpacity(0.3));

// Pulse Effect (Active Workout Timer)
Icon(Icons.circle, color: AppColors.primary)
  .animate(onPlay: (controller) => controller.repeat())
  .scale(duration: 1000.ms, begin: Offset(1, 1), end: Offset(1.2, 1.2))
  .then()
  .scale(duration: 1000.ms, begin: Offset(1.2, 1.2), end: Offset(1, 1));

// Glow Effect
Container(
  decoration: BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(16),
  ),
)
  .animate(onPlay: (controller) => controller.repeat(reverse: true))
  .boxShadow(
    duration: 2000.ms,
    begin: BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 10),
    end: BoxShadow(color: AppColors.primary.withOpacity(0.5), blurRadius: 30),
  );

// List Item Stagger
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(title: Text(items[index]))
      .animate()
      .fadeIn(delay: (index * 50).ms)
      .slideX(begin: -0.1, end: 0);
  },
);

// Page Transition
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => NextPage()),
)
  .animate()
  .fadeIn(duration: 200.ms)
  .slideX(begin: 1, end: 0);
```

#### Animation Best Practices
- Use subtle animations (200-300ms duration)
- Fade + Scale for button presses
- Slide animations for page transitions
- Pulse effect for active workout timer
- Smooth color transitions for state changes
- Stagger animations for lists (50-100ms delay per item)
- Use shimmer for loading states
- Add glow effects to highlight important elements

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

### Charts & Analytics (using fl_chart)

#### Line Chart - Workout Progress Over Time
```dart
import 'package:fl_chart/fl_chart.dart';

LineChart(
  LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: AppColors.backgroundLight,
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            return Text(
              'Week ${value.toInt()}',
              style: AppTextStyles.bodySmall,
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            return Text(
              '${value.toInt()}kg',
              style: AppTextStyles.bodySmall,
            );
          },
        ),
      ),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    ),
    borderData: FlBorderData(show: false),
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, 60),
          FlSpot(1, 65),
          FlSpot(2, 70),
          FlSpot(3, 75),
          FlSpot(4, 80),
        ],
        isCurved: true,
        color: AppColors.primary,
        barWidth: 3,
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) {
            return FlDotCirclePainter(
              radius: 6,
              color: AppColors.primary,
              strokeWidth: 2,
              strokeColor: AppColors.background,
            );
          },
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              AppColors.primary.withOpacity(0.3),
              AppColors.primary.withOpacity(0.0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    ],
  ),
);
```

#### Bar Chart - Weekly Workout Volume
```dart
BarChart(
  BarChartData(
    alignment: BarChartAlignment.spaceAround,
    maxY: 100,
    barTouchData: BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: AppColors.surface,
        tooltipRoundedRadius: 8,
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          return BarTooltipItem(
            '${rod.toY.toInt()}kg',
            AppTextStyles.bodyMedium.copyWith(color: AppColors.primary),
          );
        },
      ),
    ),
    titlesData: FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
            return Text(
              days[value.toInt()],
              style: AppTextStyles.bodySmall,
            );
          },
        ),
      ),
      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    ),
    borderData: FlBorderData(show: false),
    gridData: FlGridData(show: false),
    barGroups: [
      BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 80, color: AppColors.primary, width: 20, borderRadius: BorderRadius.vertical(top: Radius.circular(4)))]),
      BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 65, color: AppColors.primary, width: 20, borderRadius: BorderRadius.vertical(top: Radius.circular(4)))]),
      BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 90, color: AppColors.primary, width: 20, borderRadius: BorderRadius.vertical(top: Radius.circular(4)))]),
      BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 70, color: AppColors.primary, width: 20, borderRadius: BorderRadius.vertical(top: Radius.circular(4)))]),
      BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 85, color: AppColors.primary, width: 20, borderRadius: BorderRadius.vertical(top: Radius.circular(4)))]),
      BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 75, color: AppColors.primary, width: 20, borderRadius: BorderRadius.vertical(top: Radius.circular(4)))]),
      BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 0, color: AppColors.backgroundLight, width: 20, borderRadius: BorderRadius.vertical(top: Radius.circular(4)))]),
    ],
  ),
);
```

#### Pie Chart - Workout Distribution
```dart
PieChart(
  PieChartData(
    sectionsSpace: 2,
    centerSpaceRadius: 60,
    sections: [
      PieChartSectionData(
        value: 40,
        title: '40%',
        color: AppColors.primary,
        radius: 50,
        titleStyle: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        value: 30,
        title: '30%',
        color: AppColors.accent2,
        radius: 50,
        titleStyle: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        value: 20,
        title: '20%',
        color: AppColors.success,
        radius: 50,
        titleStyle: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        value: 10,
        title: '10%',
        color: AppColors.warning,
        radius: 50,
        titleStyle: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
      ),
    ],
  ),
);
```

#### Chart Best Practices
- Use orange (`AppColors.primary`) as the main chart color
- Add gradient fills below line charts for visual appeal
- Use dark background colors for chart containers
- Show tooltips on touch for detailed data
- Animate charts on load using flutter_animate
- Keep charts simple and focused on key metrics
- Use consistent styling across all charts

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
- Firestore automatically caches queries for offline access
- Use Firestore real-time listeners (snapshots) for live data
- Limit query results and use pagination for large datasets

### Testing
- Write unit tests for use cases and repositories
- Write widget tests for reusable widgets
- Write bloc tests for all blocs/cubits
- Mock FirebaseFirestore and FirebaseAuth in tests
- Use fake_cloud_firestore package for Firestore mocking

### Code Quality
- ALWAYS run `flutter analyze` before committing
- Fix all lint warnings from flutter_lints
- Use meaningful variable names
- Add comments for complex business logic
- Keep methods small and focused (< 20 lines)

## Firebase-Specific Rules

### Initialization
```dart
// main.dart - Initialize Firebase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Enable offline persistence (IMPORTANT!)
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );

  runApp(const MyApp());
}
```

### Authentication
```dart
final auth = FirebaseAuth.instance;

// Sign up
await auth.createUserWithEmailAndPassword(
  email: email,
  password: password,
);

// Sign in
await auth.signInWithEmailAndPassword(
  email: email,
  password: password,
);

// Sign out
await auth.signOut();

// Auth state
auth.authStateChanges().listen((User? user) {
  if (user != null) {
    // User is signed in
    final uid = user.uid;
    final email = user.email;
  } else {
    // User is signed out
  }
});

// Google Sign-In
final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
final credential = GoogleAuthProvider.credential(
  accessToken: googleAuth.accessToken,
  idToken: googleAuth.idToken,
);
await auth.signInWithCredential(credential);
```

### Database Operations (Firestore)
```dart
final firestore = FirebaseFirestore.instance;

// Query - Get documents
final snapshot = await firestore
    .collection('workouts')
    .where('userId', isEqualTo: userId)
    .orderBy('date', descending: true)
    .limit(20)
    .get();

final workouts = snapshot.docs
    .map((doc) => WorkoutModel.fromJson({'id': doc.id, ...doc.data()}))
    .toList();

// Insert - Add document (auto-generated ID)
await firestore.collection('workouts').add(workout.toJson());

// Insert - Set document (custom ID)
await firestore.collection('workouts').doc(workoutId).set(workout.toJson());

// Update - Merge with existing data
await firestore.collection('workouts').doc(id).update({
  'name': 'New Name',
  'updatedAt': FieldValue.serverTimestamp(),
});

// Delete
await firestore.collection('workouts').doc(id).delete();

// Real-time listener
firestore
    .collection('workouts')
    .where('userId', isEqualTo: userId)
    .orderBy('date', descending: true)
    .snapshots()
    .listen((snapshot) {
      final workouts = snapshot.docs
          .map((doc) => WorkoutModel.fromJson({'id': doc.id, ...doc.data()}))
          .toList();
      // Update UI with new data
    });

// Batch operations
final batch = firestore.batch();
batch.set(firestore.collection('workouts').doc(), workout1.toJson());
batch.update(firestore.collection('workouts').doc(id), {'completed': true});
batch.delete(firestore.collection('workouts').doc(oldId));
await batch.commit();

// Transactions
await firestore.runTransaction((transaction) async {
  final docRef = firestore.collection('users').doc(userId);
  final snapshot = await transaction.get(docRef);
  final newCount = (snapshot.data()?['workoutCount'] ?? 0) + 1;
  transaction.update(docRef, {'workoutCount': newCount});
});
```

### Storage
```dart
final storage = FirebaseStorage.instance;

// Upload file
final ref = storage.ref('workout-images/$userId/$filename');
await ref.putFile(file);

// Upload with metadata
await ref.putFile(
  file,
  SettableMetadata(
    contentType: 'image/jpeg',
    customMetadata: {'userId': userId},
  ),
);

// Get download URL
final url = await ref.getDownloadURL();

// Delete file
await ref.delete();

// List files
final listResult = await storage.ref('workout-images/$userId').listAll();
for (var item in listResult.items) {
  print(item.fullPath);
}
```

### Offline Persistence
```dart
// Firestore handles offline automatically after enabling in initialization!
// When offline:
// - Reads come from cache
// - Writes are queued and sync when online
// - Real-time listeners continue working with cached data

// Check if data is from cache
firestore.collection('workouts').snapshots().listen((snapshot) {
  if (snapshot.metadata.isFromCache) {
    // Data is from local cache (offline)
  } else {
    // Data is from server (online)
  }
});

// Disable network (for testing offline mode)
await FirebaseFirestore.instance.disableNetwork();

// Enable network
await FirebaseFirestore.instance.enableNetwork();
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