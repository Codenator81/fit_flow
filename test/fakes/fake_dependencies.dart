import 'package:fit_flow/features/auth/domain/entities/auth_user.dart';
import 'package:fit_flow/features/auth/domain/repositories/auth_repository.dart';
import 'package:fit_flow/features/workouts/domain/entities/workout.dart';
import 'package:fit_flow/features/workouts/domain/repositories/workout_repository.dart';
import 'package:fit_flow/injection_container.dart';

import 'fake_auth_repository.dart';
import 'fake_workout_repository.dart';

/// Replaces Firebase with in-memory fakes in the service locator, so the app
/// starts already signed in as [user] (pass null for signed out) with
/// [workouts] in the database.
Future<FakeAuthRepository> registerFakeDependencies({
  AuthUser? user = testUser,
  List<Workout> workouts = const [],
}) async {
  await sl.reset();
  final auth = FakeAuthRepository(user: user);
  sl
    ..registerSingleton<AuthRepository>(auth)
    ..registerSingleton<WorkoutRepository>(
      FakeWorkoutRepository()..workouts = workouts,
    );
  registerPresentation();
  return auth;
}
