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
  }) = _WorkoutDay;
}
