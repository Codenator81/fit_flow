import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.freezed.dart';

@freezed
sealed class ExerciseCompletion with _$ExerciseCompletion {
  const factory ExerciseCompletion({
    required DateTime date,
    required int maxSets,
    required int maxReps,
  }) = _ExerciseCompletion;
}

@freezed
sealed class Exercise with _$Exercise {
  const factory Exercise({
    required String id,
    required String name,
    required int sets,
    required int reps,
    @Default(60) int restSeconds,
    @Default([]) List<ExerciseCompletion> history,
  }) = _Exercise;
}
