// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutModel _$WorkoutModelFromJson(Map<String, dynamic> json) => WorkoutModel(
  id: json['id'] as String,
  userId: json['userId'] as String,
  name: json['name'] as String,
  days: (json['days'] as List<dynamic>)
      .map((e) => WorkoutDayModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$WorkoutModelToJson(WorkoutModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'days': instance.days,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
