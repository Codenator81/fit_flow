import 'dart:convert';

import 'package:fit_flow/features/workouts/data/models/workout_day_model.dart';
import 'package:fit_flow/features/workouts/domain/entities/exercise.dart';
import 'package:fit_flow/features/workouts/domain/entities/workout_day.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WorkoutDayModel', () {
    test('fromJson applies defaults for flags and completedDate', () {
      final model = WorkoutDayModel.fromJson({
        'id': 'd1',
        'name': 'Legs',
        'dayNumber': 1,
        'exercises': <dynamic>[],
      });

      expect(model.isRestDay, isFalse);
      expect(model.isCompleted, isFalse);
      expect(model.isActive, isFalse);
      expect(model.completedDate, isNull);
    });

    test('fromJson parses nested exercises and completedDate', () {
      final model = WorkoutDayModel.fromJson({
        'id': 'd1',
        'name': 'Push',
        'dayNumber': 2,
        'exercises': [
          {'id': 'e1', 'name': 'Bench press', 'sets': 4, 'reps': 8},
        ],
        'isCompleted': true,
        'completedDate': '2026-02-01T08:00:00.000Z',
      });

      expect(model.exercises.single.name, 'Bench press');
      expect(model.exercises.single.restSeconds, 60);
      expect(model.isCompleted, isTrue);
      expect(model.completedDate, DateTime.utc(2026, 2, 1, 8));
    });

    test('toJson writes null completedDate when not completed', () {
      const model = WorkoutDayModel(
        id: 'd1',
        name: 'Rest',
        dayNumber: 3,
        exercises: [],
        isRestDay: true,
      );

      final json = model.toJson();

      expect(json['completedDate'], isNull);
      expect(json['isRestDay'], isTrue);
    });

    test('entity conversion and JSON round-trip preserve every field', () {
      final entity = WorkoutDay(
        id: 'd1',
        name: 'Pull',
        dayNumber: 4,
        exercises: const [
          Exercise(id: 'e1', name: 'Row', sets: 3, reps: 12, restSeconds: 45),
        ],
        isCompleted: true,
        isActive: true,
        completedDate: DateTime.utc(2026, 3, 10),
      );

      final model = WorkoutDayModel.fromEntity(entity);
      final decoded = WorkoutDayModel.fromJson(
        jsonDecode(jsonEncode(model.toJson())) as Map<String, dynamic>,
      );

      expect(model.toEntity(), entity);
      expect(decoded.toEntity(), entity);
    });
  });
}
