import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/workout.dart';

part 'workout_state.freezed.dart';

@freezed
sealed class WorkoutState with _$WorkoutState {
  const factory WorkoutState.initial() = WorkoutInitial;

  const factory WorkoutState.loading() = WorkoutLoading;

  const factory WorkoutState.loaded(List<Workout> workouts) = WorkoutLoaded;

  const factory WorkoutState.detail(Workout workout) = WorkoutDetail;

  const factory WorkoutState.error(String message) = WorkoutError;
}
