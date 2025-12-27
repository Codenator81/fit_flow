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
    );

Map<String, dynamic> _$WorkoutDayModelToJson(WorkoutDayModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dayNumber': instance.dayNumber,
      'exercises': instance.exercises,
    };
