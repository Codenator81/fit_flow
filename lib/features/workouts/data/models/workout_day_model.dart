import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/workout_day.dart';
import 'exercise_model.dart';

part 'workout_day_model.g.dart';

@JsonSerializable()
class WorkoutDayModel {
  final String id;
  final String name;
  final int dayNumber;
  final List<ExerciseModel> exercises;

  const WorkoutDayModel({
    required this.id,
    required this.name,
    required this.dayNumber,
    required this.exercises,
  });

  factory WorkoutDayModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutDayModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutDayModelToJson(this);

  WorkoutDay toEntity() {
    return WorkoutDay(
      id: id,
      name: name,
      dayNumber: dayNumber,
      exercises: exercises.map((e) => e.toEntity()).toList(),
    );
  }

  factory WorkoutDayModel.fromEntity(WorkoutDay day) {
    return WorkoutDayModel(
      id: day.id,
      name: day.name,
      dayNumber: day.dayNumber,
      exercises: day.exercises.map((e) => ExerciseModel.fromEntity(e)).toList(),
    );
  }
}
