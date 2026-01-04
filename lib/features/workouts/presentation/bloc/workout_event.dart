import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_event.freezed.dart';

@freezed
sealed class WorkoutEvent with _$WorkoutEvent {
  const factory WorkoutEvent.loadWorkouts() = LoadWorkouts;

  const factory WorkoutEvent.createWorkout(String name) = CreateWorkout;

  const factory WorkoutEvent.deleteWorkout(String workoutId) = DeleteWorkout;

  const factory WorkoutEvent.loadWorkoutDetail(String workoutId) = LoadWorkoutDetail;

  const factory WorkoutEvent.addDay({
    required String workoutId,
    required String dayName,
  }) = AddDay;

  const factory WorkoutEvent.addExercise({
    required String workoutId,
    required String dayId,
    required String exerciseName,
    required int sets,
    required int reps,
  }) = AddExercise;

  const factory WorkoutEvent.updateExerciseProgress({
    required String workoutId,
    required String dayId,
    required String exerciseId,
    required int completedSets,
    required int completedReps,
  }) = UpdateExerciseProgress;
}
