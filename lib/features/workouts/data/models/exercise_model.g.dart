// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseCompletionModel _$ExerciseCompletionModelFromJson(
  Map<String, dynamic> json,
) => ExerciseCompletionModel(
  date: DateTime.parse(json['date'] as String),
  maxSets: (json['maxSets'] as num).toInt(),
  maxReps: (json['maxReps'] as num).toInt(),
);

Map<String, dynamic> _$ExerciseCompletionModelToJson(
  ExerciseCompletionModel instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'maxSets': instance.maxSets,
  'maxReps': instance.maxReps,
};

ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) =>
    ExerciseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      sets: (json['sets'] as num).toInt(),
      reps: (json['reps'] as num).toInt(),
      restSeconds: (json['restSeconds'] as num?)?.toInt() ?? 60,
      history:
          (json['history'] as List<dynamic>?)
              ?.map(
                (e) =>
                    ExerciseCompletionModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ExerciseModelToJson(ExerciseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sets': instance.sets,
      'reps': instance.reps,
      'restSeconds': instance.restSeconds,
      'history': instance.history,
    };
