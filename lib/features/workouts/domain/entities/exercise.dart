import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.freezed.dart';

@freezed
sealed class Exercise with _$Exercise {
  const factory Exercise({
    required String id,
    required String name,
    required int expectedSets,
    required int expectedReps,
    @Default(0) int completedSets,
    @Default(0) int completedReps,
  }) = _Exercise;
}
