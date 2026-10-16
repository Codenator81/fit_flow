import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/workouts/data/repositories/workout_repository_impl.dart';
import 'features/workouts/domain/repositories/workout_repository.dart';
import 'features/workouts/presentation/bloc/workout_bloc.dart';

/// Service locator. Pages resolve repositories and blocs from here, so tests
/// can register in-memory fakes instead of Firebase.
final sl = GetIt.instance;

/// Registers the real Firebase-backed dependencies. Call after
/// `Firebase.initializeApp()`.
void initDependencies() {
  sl
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)
    ..registerLazySingleton<GoogleSignIn>(GoogleSignIn.new)
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(auth: sl(), googleSignIn: sl()),
    )
    ..registerLazySingleton<WorkoutRepository>(
      () => WorkoutRepositoryImpl(firestore: sl(), auth: sl()),
    );
  registerPresentation();
}

/// Registers blocs on top of whatever repositories are registered (real or
/// fake).
void registerPresentation() {
  sl.registerFactory<WorkoutBloc>(() => WorkoutBloc(sl()));
}
