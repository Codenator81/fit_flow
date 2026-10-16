import 'package:dartz/dartz.dart';
import 'package:fit_flow/core/error/failures.dart';
import 'package:fit_flow/features/workouts/domain/entities/workout.dart';
import 'package:fit_flow/features/workouts/domain/repositories/workout_repository.dart';

/// In-memory repository: records calls and returns configurable results,
/// so blocs and screens can be tested without Firebase.
class FakeWorkoutRepository implements WorkoutRepository {
  List<Workout> workouts = [];
  Failure? failure;
  final List<String> calls = [];

  Future<Either<Failure, T>> _result<T>(String call, T value) async {
    calls.add(call);
    final f = failure;
    return f != null ? Left(f) : Right(value);
  }

  Workout _find(String id) => workouts.firstWhere((w) => w.id == id);

  @override
  Future<Either<Failure, List<Workout>>> getWorkouts() =>
      _result('getWorkouts', workouts);

  @override
  Future<Either<Failure, Workout>> getWorkout(String id) async {
    calls.add('getWorkout:$id');
    final f = failure;
    return f != null ? Left(f) : Right(_find(id));
  }

  @override
  Future<Either<Failure, Workout>> createWorkout(String name) {
    final workout = Workout(
      id: 'new',
      userId: 'u1',
      name: name,
      days: const [],
      createdAt: DateTime.utc(2026, 1, 1),
      updatedAt: DateTime.utc(2026, 1, 1),
    );
    if (failure == null) workouts = [...workouts, workout];
    return _result('createWorkout:$name', workout);
  }

  @override
  Future<Either<Failure, Unit>> deleteWorkout(String id) {
    if (failure == null) {
      workouts = workouts.where((w) => w.id != id).toList();
    }
    return _result('deleteWorkout:$id', unit);
  }

  @override
  Future<Either<Failure, Unit>> addDay(
    String workoutId,
    String dayName, {
    bool isRestDay = false,
  }) => _result('addDay:$workoutId:$dayName:$isRestDay', unit);

  @override
  Future<Either<Failure, Unit>> deleteDay(String workoutId, String dayId) =>
      _result('deleteDay:$workoutId:$dayId', unit);

  @override
  Future<Either<Failure, Unit>> addExercise(
    String workoutId,
    String dayId,
    String exerciseName,
    int sets,
    int reps,
    int restSeconds,
  ) => _result(
    'addExercise:$workoutId:$dayId:$exerciseName:$sets:$reps:$restSeconds',
    unit,
  );

  @override
  Future<Either<Failure, Unit>> completeDay(
    String workoutId,
    String dayId,
    Map<String, Map<String, int>> exerciseProgress,
  ) =>
      _result('completeDay:$workoutId:$dayId:${exerciseProgress.length}', unit);

  @override
  Future<Either<Failure, Unit>> markRestDayComplete(
    String workoutId,
    String dayId,
  ) => _result('markRestDayComplete:$workoutId:$dayId', unit);

  @override
  Future<Either<Failure, Unit>> resetWorkout(String workoutId) =>
      _result('resetWorkout:$workoutId', unit);

  @override
  Future<Either<Failure, Unit>> setActiveDay(String workoutId, String dayId) =>
      _result('setActiveDay:$workoutId:$dayId', unit);
}
