// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutDayModel _$WorkoutDayModelFromJson(Map<String, dynamic> json) =>
    WorkoutDayModel(
      id: json['id'] as String,
      name: json['name'] as String,
      dayNumber: (json['dayNumber'] as num).toInt(),
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => ExerciseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isRestDay: json['isRestDay'] as bool? ?? false,
      isCompleted: json['isCompleted'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? false,
      completedDate: json['completedDate'] == null
          ? null
          : DateTime.parse(json['completedDate'] as String),
    );

Map<String, dynamic> _$WorkoutDayModelToJson(WorkoutDayModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dayNumber': instance.dayNumber,
      'exercises': instance.exercises,
      'isRestDay': instance.isRestDay,
      'isCompleted': instance.isCompleted,
      'isActive': instance.isActive,
      'completedDate': instance.completedDate?.toIso8601String(),
    };
