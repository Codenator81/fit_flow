import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/workout_repository.dart';
import 'workout_event.dart';
import 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final WorkoutRepository repository;

  WorkoutBloc(this.repository) : super(const WorkoutInitial()) {
    on<LoadWorkouts>(_onLoadWorkouts);
    on<CreateWorkout>(_onCreateWorkout);
    on<LoadWorkoutDetail>(_onLoadWorkoutDetail);
    on<AddDay>(_onAddDay);
    on<AddExercise>(_onAddExercise);
    on<UpdateExerciseProgress>(_onUpdateExerciseProgress);
  }

  Future<void> _onLoadWorkouts(
    LoadWorkouts event,
    Emitter<WorkoutState> emit,
  ) async {
    emit(const WorkoutLoading());

    final result = await repository.getWorkouts();

    result.fold(
      (failure) => emit(WorkoutError(failure.message)),
      (workouts) => emit(WorkoutLoaded(workouts)),
    );
  }

  Future<void> _onCreateWorkout(
    CreateWorkout event,
    Emitter<WorkoutState> emit,
  ) async {
    emit(const WorkoutLoading());

    final result = await repository.createWorkout(event.name);

    result.fold(
      (failure) => emit(WorkoutError(failure.message)),
      (_) async {
        // Reload workouts after creation
        add(const LoadWorkouts());
      },
    );
  }

  Future<void> _onLoadWorkoutDetail(
    LoadWorkoutDetail event,
    Emitter<WorkoutState> emit,
  ) async {
    emit(const WorkoutLoading());

    final result = await repository.getWorkout(event.workoutId);

    result.fold(
      (failure) => emit(WorkoutError(failure.message)),
      (workout) => emit(WorkoutDetail(workout)),
    );
  }

  Future<void> _onAddDay(AddDay event, Emitter<WorkoutState> emit) async {
    final result = await repository.addDay(event.workoutId, event.dayName);

    result.fold(
      (failure) => emit(WorkoutError(failure.message)),
      (_) {
        // Reload workout detail
        add(LoadWorkoutDetail(event.workoutId));
      },
    );
  }

  Future<void> _onAddExercise(
    AddExercise event,
    Emitter<WorkoutState> emit,
  ) async {
    final result = await repository.addExercise(
      event.workoutId,
      event.dayId,
      event.exerciseName,
      event.sets,
      event.reps,
    );

    result.fold(
      (failure) => emit(WorkoutError(failure.message)),
      (_) {
        // Reload workout detail
        add(LoadWorkoutDetail(event.workoutId));
      },
    );
  }

  Future<void> _onUpdateExerciseProgress(
    UpdateExerciseProgress event,
    Emitter<WorkoutState> emit,
  ) async {
    final result = await repository.updateExerciseProgress(
      event.workoutId,
      event.dayId,
      event.exerciseId,
      event.completedSets,
      event.completedReps,
    );

    result.fold(
      (failure) => emit(WorkoutError(failure.message)),
      (_) {
        // Reload workout detail
        add(LoadWorkoutDetail(event.workoutId));
      },
    );
  }
}
