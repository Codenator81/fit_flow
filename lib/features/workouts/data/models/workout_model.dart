import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/workout.dart';
import 'workout_day_model.dart';

part 'workout_model.g.dart';

@JsonSerializable()
class WorkoutModel {
  final String id;
  final String userId;
  final String name;
  final List<WorkoutDayModel> days;
  final DateTime createdAt;
  final DateTime updatedAt;

  const WorkoutModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.days,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutModelToJson(this);

  Workout toEntity() {
    return Workout(
      id: id,
      userId: userId,
      name: name,
      days: days.map((day) => day.toEntity()).toList(),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory WorkoutModel.fromEntity(Workout workout) {
    return WorkoutModel(
      id: workout.id,
      userId: workout.userId,
      name: workout.name,
      days: workout.days.map((day) => WorkoutDayModel.fromEntity(day)).toList(),
      createdAt: workout.createdAt,
      updatedAt: workout.updatedAt,
    );
  }
}
