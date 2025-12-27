# FitFlow

A modern Flutter fitness app with offline-first architecture and custom workout workflows.

## Tech Stack

### Backend & Database
- **supabase_flutter** - All-in-one backend solution
  - PostgreSQL database with offline support
  - Real-time subscriptions
  - Authentication (email, OAuth, magic links)
  - File storage
  - Edge functions

### State Management
- **flutter_bloc** - Business logic component pattern
- **equatable** - Value equality for state objects

### Dependency Injection
- **get_it** - Service locator for dependency injection

### Networking
- **dio** - Powerful HTTP client
- **pretty_dio_logger** - HTTP request/response logging

### Functional Programming
- **dartz** - Functional programming utilities (Either, Option, etc.)

### Code Generation
- **freezed** + **freezed_annotation** - Immutable classes & unions
- **json_serializable** + **json_annotation** - JSON serialization
- **build_runner** - Code generation build system

### Routing
- **go_router** - Declarative routing with deep linking

### Internationalization
- **intl** - Date/time formatting and i18n

## Project Architecture

```
lib/
├── core/           # Core utilities, constants, errors
├── features/       # Feature modules
│   ├── auth/
│   ├── workouts/
│   ├── exercises/
│   └── profile/
└── main.dart
```

## Features

- ✅ Offline-first architecture
- ✅ Real-time data synchronization
- ✅ Custom workout workflows
- ✅ User authentication
- ✅ Progress tracking
- ✅ Cloud backup with Supabase

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Set up Supabase:
   - Create a project at [supabase.com](https://supabase.com)
   - Add your credentials to the app

3. Run the app:
   ```bash
   flutter run
   ```