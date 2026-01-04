import 'package:freezed_annotation/freezed_annotation.dart';
import 'exercise.dart';

part 'workout_day.freezed.dart';

@freezed
sealed class WorkoutDay with _$WorkoutDay {
  const factory WorkoutDay({
    required String id,
    required String name,
    required int dayNumber,
    required List<Exercise> exercises,
    @Default(false) bool isRestDay,
    @Default(false) bool isCompleted,
    @Default(false) bool isActive,
    DateTime? completedDate,
  }) = _WorkoutDay;
}
