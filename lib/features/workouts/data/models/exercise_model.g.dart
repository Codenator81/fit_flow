// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) =>
    ExerciseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      expectedSets: (json['expectedSets'] as num).toInt(),
      expectedReps: (json['expectedReps'] as num).toInt(),
      completedSets: (json['completedSets'] as num?)?.toInt() ?? 0,
      completedReps: (json['completedReps'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ExerciseModelToJson(ExerciseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'expectedSets': instance.expectedSets,
      'expectedReps': instance.expectedReps,
      'completedSets': instance.completedSets,
      'completedReps': instance.completedReps,
    };
