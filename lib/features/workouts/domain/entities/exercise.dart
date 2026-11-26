import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.freezed.dart';

@freezed
sealed class ExerciseCompletion with _$ExerciseCompletion {
  const factory ExerciseCompletion({
    required DateTime date,
    required int maxSets,
    required int maxReps,
    double? maxWeight,
  }) = _ExerciseCompletion;
}

/// What was done for one exercise on a finished day, and the new sets × reps
/// target when the user chose to change it.
@freezed
sealed class ExerciseResult with _$ExerciseResult {
  const factory ExerciseResult({
    required int sets,
    required int reps,
    double? maxWeight,
    int? targetSets,
    int? targetReps,
    double? targetWeight,
  }) = _ExerciseResult;
}

@freezed
sealed class Exercise with _$Exercise {
  const factory Exercise({
    required String id,
    required String name,
    required int sets,
    required int reps,
    @Default(false) bool tracksWeight,
    double? targetWeight,
    @Default([]) List<ExerciseCompletion> history,
  }) = _Exercise;
}
