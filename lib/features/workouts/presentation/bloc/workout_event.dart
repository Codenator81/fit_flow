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
    required bool isRestDay,
  }) = AddDay;

  const factory WorkoutEvent.deleteDay({
    required String workoutId,
    required String dayId,
  }) = DeleteDay;

  const factory WorkoutEvent.addExercise({
    required String workoutId,
    required String dayId,
    required String exerciseName,
    required int sets,
    required int reps,
    required int restSeconds,
  }) = AddExercise;

  const factory WorkoutEvent.completeDay({
    required String workoutId,
    required String dayId,
    required Map<String, Map<String, int>> exerciseProgress,
  }) = CompleteDay;

  const factory WorkoutEvent.markRestDayComplete({
    required String workoutId,
    required String dayId,
  }) = MarkRestDayComplete;

  const factory WorkoutEvent.resetWorkout(String workoutId) = ResetWorkout;

  const factory WorkoutEvent.setActiveDay({
    required String workoutId,
    required String dayId,
  }) = SetActiveDay;
}
