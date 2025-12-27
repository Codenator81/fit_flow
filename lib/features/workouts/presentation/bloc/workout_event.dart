import 'package:equatable/equatable.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object?> get props => [];
}

class LoadWorkouts extends WorkoutEvent {
  const LoadWorkouts();
}

class CreateWorkout extends WorkoutEvent {
  final String name;

  const CreateWorkout(this.name);

  @override
  List<Object?> get props => [name];
}

class LoadWorkoutDetail extends WorkoutEvent {
  final String workoutId;

  const LoadWorkoutDetail(this.workoutId);

  @override
  List<Object?> get props => [workoutId];
}

class AddDay extends WorkoutEvent {
  final String workoutId;
  final String dayName;

  const AddDay(this.workoutId, this.dayName);

  @override
  List<Object?> get props => [workoutId, dayName];
}

class AddExercise extends WorkoutEvent {
  final String workoutId;
  final String dayId;
  final String exerciseName;
  final int sets;
  final int reps;

  const AddExercise(
    this.workoutId,
    this.dayId,
    this.exerciseName,
    this.sets,
    this.reps,
  );

  @override
  List<Object?> get props => [workoutId, dayId, exerciseName, sets, reps];
}

class UpdateExerciseProgress extends WorkoutEvent {
  final String workoutId;
  final String dayId;
  final String exerciseId;
  final int completedSets;
  final int completedReps;

  const UpdateExerciseProgress(
    this.workoutId,
    this.dayId,
    this.exerciseId,
    this.completedSets,
    this.completedReps,
  );

  @override
  List<Object?> get props => [
        workoutId,
        dayId,
        exerciseId,
        completedSets,
        completedReps,
      ];
}
