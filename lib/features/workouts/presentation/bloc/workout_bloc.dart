import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/workout_repository.dart';
import 'workout_event.dart';
import 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final WorkoutRepository repository;

  WorkoutBloc(this.repository) : super(const WorkoutState.initial()) {
    on<LoadWorkouts>(_onLoadWorkouts);
    on<CreateWorkout>(_onCreateWorkout);
    on<DeleteWorkout>(_onDeleteWorkout);
    on<LoadWorkoutDetail>(_onLoadWorkoutDetail);
    on<AddDay>(_onAddDay);
    on<DeleteDay>(_onDeleteDay);
    on<AddExercise>(_onAddExercise);
    on<CompleteDay>(_onCompleteDay);
    on<MarkRestDayComplete>(_onMarkRestDayComplete);
    on<ResetWorkout>(_onResetWorkout);
    on<SetActiveDay>(_onSetActiveDay);
  }

  Future<void> _onLoadWorkouts(
    LoadWorkouts event,
    Emitter<WorkoutState> emit,
  ) async {
    emit(const WorkoutState.loading());

    final result = await repository.getWorkouts();

    result.fold(
      (failure) => emit(WorkoutState.error(failure.message)),
      (workouts) => emit(WorkoutState.loaded(workouts)),
    );
  }

  Future<void> _onCreateWorkout(
    CreateWorkout event,
    Emitter<WorkoutState> emit,
  ) async {
    emit(const WorkoutState.loading());

    final result = await repository.createWorkout(event.name);

    result.fold((failure) => emit(WorkoutState.error(failure.message)), (
      _,
    ) async {
      // Reload workouts after creation
      add(const WorkoutEvent.loadWorkouts());
    });
  }

  Future<void> _onDeleteWorkout(
    DeleteWorkout event,
    Emitter<WorkoutState> emit,
  ) async {
    emit(const WorkoutState.loading());

    final result = await repository.deleteWorkout(event.workoutId);

    result.fold((failure) => emit(WorkoutState.error(failure.message)), (
      _,
    ) async {
      // Reload workouts after deletion
      add(const WorkoutEvent.loadWorkouts());
    });
  }

  Future<void> _onLoadWorkoutDetail(
    LoadWorkoutDetail event,
    Emitter<WorkoutState> emit,
  ) async {
    emit(const WorkoutState.loading());

    final result = await repository.getWorkout(event.workoutId);

    result.fold(
      (failure) => emit(WorkoutState.error(failure.message)),
      (workout) => emit(WorkoutState.detail(workout)),
    );
  }

  Future<void> _onAddDay(AddDay event, Emitter<WorkoutState> emit) async {
    final result = await repository.addDay(
      event.workoutId,
      event.dayName,
      isRestDay: event.isRestDay,
    );

    result.fold((failure) => emit(WorkoutState.error(failure.message)), (_) {
      // Reload workout detail
      add(WorkoutEvent.loadWorkoutDetail(event.workoutId));
    });
  }

  Future<void> _onDeleteDay(DeleteDay event, Emitter<WorkoutState> emit) async {
    final result = await repository.deleteDay(event.workoutId, event.dayId);

    result.fold((failure) => emit(WorkoutState.error(failure.message)), (_) {
      // Reload workout detail
      add(WorkoutEvent.loadWorkoutDetail(event.workoutId));
    });
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
      event.restSeconds,
    );

    result.fold((failure) => emit(WorkoutState.error(failure.message)), (_) {
      // Reload workout detail
      add(WorkoutEvent.loadWorkoutDetail(event.workoutId));
    });
  }

  Future<void> _onCompleteDay(
    CompleteDay event,
    Emitter<WorkoutState> emit,
  ) async {
    final result = await repository.completeDay(
      event.workoutId,
      event.dayId,
      event.exerciseProgress,
    );

    result.fold((failure) => emit(WorkoutState.error(failure.message)), (_) {
      // Reload workout detail
      add(WorkoutEvent.loadWorkoutDetail(event.workoutId));
    });
  }

  Future<void> _onMarkRestDayComplete(
    MarkRestDayComplete event,
    Emitter<WorkoutState> emit,
  ) async {
    final result = await repository.markRestDayComplete(
      event.workoutId,
      event.dayId,
    );

    result.fold((failure) => emit(WorkoutState.error(failure.message)), (_) {
      // Reload workout detail
      add(WorkoutEvent.loadWorkoutDetail(event.workoutId));
    });
  }

  Future<void> _onResetWorkout(
    ResetWorkout event,
    Emitter<WorkoutState> emit,
  ) async {
    final result = await repository.resetWorkout(event.workoutId);

    result.fold((failure) => emit(WorkoutState.error(failure.message)), (_) {
      // Reload workout detail
      add(WorkoutEvent.loadWorkoutDetail(event.workoutId));
    });
  }

  Future<void> _onSetActiveDay(
    SetActiveDay event,
    Emitter<WorkoutState> emit,
  ) async {
    final result = await repository.setActiveDay(event.workoutId, event.dayId);

    result.fold((failure) => emit(WorkoutState.error(failure.message)), (_) {
      // Reload workout detail
      add(WorkoutEvent.loadWorkoutDetail(event.workoutId));
    });
  }
}
