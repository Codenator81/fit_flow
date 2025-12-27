import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/exercise.dart';

part 'exercise_model.g.dart';

@JsonSerializable()
class ExerciseModel {
  final String id;
  final String name;
  final int expectedSets;
  final int expectedReps;
  final int completedSets;
  final int completedReps;

  const ExerciseModel({
    required this.id,
    required this.name,
    required this.expectedSets,
    required this.expectedReps,
    this.completedSets = 0,
    this.completedReps = 0,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseModelToJson(this);

  Exercise toEntity() {
    return Exercise(
      id: id,
      name: name,
      expectedSets: expectedSets,
      expectedReps: expectedReps,
      completedSets: completedSets,
      completedReps: completedReps,
    );
  }

  factory ExerciseModel.fromEntity(Exercise exercise) {
    return ExerciseModel(
      id: exercise.id,
      name: exercise.name,
      expectedSets: exercise.expectedSets,
      expectedReps: exercise.expectedReps,
      completedSets: exercise.completedSets,
      completedReps: exercise.completedReps,
    );
  }
}
