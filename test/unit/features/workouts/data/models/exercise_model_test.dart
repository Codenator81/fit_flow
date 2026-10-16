import 'dart:convert';

import 'package:fit_flow/features/workouts/data/models/exercise_model.dart';
import 'package:fit_flow/features/workouts/domain/entities/exercise.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final date = DateTime.utc(2026, 1, 15, 10, 30);

  group('ExerciseCompletionModel', () {
    test('fromJson parses an ISO-8601 date and ints', () {
      final model = ExerciseCompletionModel.fromJson({
        'date': '2026-01-15T10:30:00.000Z',
        'maxSets': 4,
        'maxReps': 12,
      });

      expect(model.date, date);
      expect(model.maxSets, 4);
      expect(model.maxReps, 12);
    });

    test('toJson writes the date as an ISO-8601 string', () {
      final json = ExerciseCompletionModel(
        date: date,
        maxSets: 3,
        maxReps: 8,
      ).toJson();

      expect(json, {
        'date': '2026-01-15T10:30:00.000Z',
        'maxSets': 3,
        'maxReps': 8,
      });
    });

    test('entity conversion round-trips', () {
      final entity = ExerciseCompletion(date: date, maxSets: 5, maxReps: 5);

      expect(ExerciseCompletionModel.fromEntity(entity).toEntity(), entity);
    });
  });

  group('ExerciseModel', () {
    test('fromJson applies defaults for missing restSeconds and history', () {
      final model = ExerciseModel.fromJson({
        'id': 'e1',
        'name': 'Squat',
        'sets': 3,
        'reps': 10,
      });

      expect(model.restSeconds, 60);
      expect(model.history, isEmpty);
    });

    test('fromJson accepts numeric values stored as doubles', () {
      // Firestore can return whole numbers as doubles.
      final model = ExerciseModel.fromJson({
        'id': 'e1',
        'name': 'Squat',
        'sets': 3.0,
        'reps': 10.0,
        'restSeconds': 90.0,
      });

      expect(model.sets, 3);
      expect(model.reps, 10);
      expect(model.restSeconds, 90);
    });

    test('survives a JSON encode/decode round-trip with history', () {
      final model = ExerciseModel(
        id: 'e1',
        name: 'Bench press',
        sets: 4,
        reps: 8,
        restSeconds: 120,
        history: [ExerciseCompletionModel(date: date, maxSets: 4, maxReps: 9)],
      );

      final decoded = ExerciseModel.fromJson(
        jsonDecode(jsonEncode(model.toJson())) as Map<String, dynamic>,
      );

      expect(decoded.toEntity(), model.toEntity());
    });

    test('entity conversion round-trips including history', () {
      final entity = Exercise(
        id: 'e1',
        name: 'Deadlift',
        sets: 5,
        reps: 3,
        restSeconds: 180,
        history: [ExerciseCompletion(date: date, maxSets: 5, maxReps: 3)],
      );

      expect(ExerciseModel.fromEntity(entity).toEntity(), entity);
    });
  });
}
