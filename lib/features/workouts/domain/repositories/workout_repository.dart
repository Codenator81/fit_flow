import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/workout.dart';

abstract class WorkoutRepository {
  Future<Either<Failure, List<Workout>>> getWorkouts();
  Future<Either<Failure, Workout>> getWorkout(String id);
  Future<Either<Failure, Workout>> createWorkout(String name);
  Future<Either<Failure, Unit>> deleteWorkout(String id);
  Future<Either<Failure, Unit>> addDay(String workoutId, String dayName);
  Future<Either<Failure, Unit>> addExercise(
    String workoutId,
    String dayId,
    String exerciseName,
    int sets,
    int reps,
  );
  Future<Either<Failure, Unit>> updateExerciseProgress(
    String workoutId,
    String dayId,
    String exerciseId,
    int completedSets,
    int completedReps,
  );
}
