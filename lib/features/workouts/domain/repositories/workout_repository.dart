import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/workout.dart';

abstract class WorkoutRepository {
  Future<Either<Failure, List<Workout>>> getWorkouts();
  Future<Either<Failure, Workout>> getWorkout(String id);
  Future<Either<Failure, Workout>> createWorkout(String name);
  Future<Either<Failure, Unit>> deleteWorkout(String id);
  Future<Either<Failure, Unit>> addDay(String workoutId, String dayName, {bool isRestDay = false});
  Future<Either<Failure, Unit>> deleteDay(String workoutId, String dayId);
  Future<Either<Failure, Unit>> addExercise(
    String workoutId,
    String dayId,
    String exerciseName,
    int sets,
    int reps,
    int restSeconds,
  );
  Future<Either<Failure, Unit>> completeDay(
    String workoutId,
    String dayId,
    Map<String, Map<String, int>> exerciseProgress, // exerciseId -> {sets, reps}
  );
  Future<Either<Failure, Unit>> markRestDayComplete(
    String workoutId,
    String dayId,
  );
  Future<Either<Failure, Unit>> resetWorkout(String workoutId);
  Future<Either<Failure, Unit>> setActiveDay(String workoutId, String dayId);
}
