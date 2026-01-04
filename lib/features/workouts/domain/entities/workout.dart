import 'package:freezed_annotation/freezed_annotation.dart';
import 'workout_day.dart';

part 'workout.freezed.dart';

@freezed
sealed class Workout with _$Workout {
  const factory Workout({
    required String id,
    required String userId,
    required String name,
    required List<WorkoutDay> days,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Workout;
}
