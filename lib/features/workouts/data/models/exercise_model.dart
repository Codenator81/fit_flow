import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/exercise.dart';

part 'exercise_model.g.dart';

@JsonSerializable()
class ExerciseCompletionModel {
  final DateTime date;
  final int maxSets;
  final int maxReps;

  const ExerciseCompletionModel({
    required this.date,
    required this.maxSets,
    required this.maxReps,
  });

  factory ExerciseCompletionModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseCompletionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseCompletionModelToJson(this);

  ExerciseCompletion toEntity() {
    return ExerciseCompletion(date: date, maxSets: maxSets, maxReps: maxReps);
  }

  factory ExerciseCompletionModel.fromEntity(ExerciseCompletion completion) {
    return ExerciseCompletionModel(
      date: completion.date,
      maxSets: completion.maxSets,
      maxReps: completion.maxReps,
    );
  }
}

@JsonSerializable()
class ExerciseModel {
  final String id;
  final String name;
  final int sets;
  final int reps;
  final int restSeconds;
  final List<ExerciseCompletionModel> history;

  const ExerciseModel({
    required this.id,
    required this.name,
    required this.sets,
    required this.reps,
    this.restSeconds = 60,
    this.history = const [],
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseModelToJson(this);

  Exercise toEntity() {
    return Exercise(
      id: id,
      name: name,
      sets: sets,
      reps: reps,
      restSeconds: restSeconds,
      history: history.map((h) => h.toEntity()).toList(),
    );
  }

  factory ExerciseModel.fromEntity(Exercise exercise) {
    return ExerciseModel(
      id: exercise.id,
      name: exercise.name,
      sets: exercise.sets,
      reps: exercise.reps,
      restSeconds: exercise.restSeconds,
      history: exercise.history
          .map((h) => ExerciseCompletionModel.fromEntity(h))
          .toList(),
    );
  }
}
