# FitFlow

A modern Flutter fitness app with offline-first architecture and custom workout workflows.

## Tech Stack

### Backend & Database
- **Firebase** - All-in-one backend solution (100% free on Spark plan)
  - **cloud_firestore** - NoSQL database with automatic offline persistence
  - **firebase_auth** - Authentication (email, Google, Apple, etc.)
  - **firebase_core** - Core Firebase SDK
  - ~~firebase_storage~~ - Not included (requires Blaze plan)

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

### UI Enhancements
- **google_fonts** - Custom typography (Montserrat, Roboto, etc.)
- **flutter_animate** - Smooth animations and transitions
- **fl_chart** - Beautiful charts for progress tracking

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
- ✅ Cloud backup with Firebase

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Set up Firebase:
   - Create a project at [console.firebase.google.com](https://console.firebase.google.com)
   - Enable **Firestore Database** (Native mode, Test mode for development)
   - Enable **Authentication** → Email/Password provider
   - Download and add config files:
     - Android: `google-services.json` → `android/app/`

3. Run the app:
   ```bash
   flutter run
   ```