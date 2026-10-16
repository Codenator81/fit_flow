import 'dart:convert';

import 'package:fit_flow/features/workouts/data/models/workout_model.dart';
import 'package:fit_flow/features/workouts/domain/entities/exercise.dart';
import 'package:fit_flow/features/workouts/domain/entities/workout.dart';
import 'package:fit_flow/features/workouts/domain/entities/workout_day.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final createdAt = DateTime.utc(2026, 1, 1);
  final updatedAt = DateTime.utc(2026, 1, 2, 12);

  Workout buildWorkout() => Workout(
    id: 'w1',
    userId: 'u1',
    name: 'Full body',
    days: [
      WorkoutDay(
        id: 'd1',
        name: 'Day A',
        dayNumber: 1,
        exercises: [
          Exercise(
            id: 'e1',
            name: 'Squat',
            sets: 5,
            reps: 5,
            history: [
              ExerciseCompletion(date: updatedAt, maxSets: 5, maxReps: 6),
            ],
          ),
        ],
        isActive: true,
      ),
      const WorkoutDay(
        id: 'd2',
        name: 'Rest',
        dayNumber: 2,
        exercises: [],
        isRestDay: true,
      ),
    ],
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  group('WorkoutModel', () {
    test('fromJson parses a Firestore-shaped document', () {
      // Mirrors how the repository reads a doc: {'id': doc.id, ...doc.data()}.
      final model = WorkoutModel.fromJson({
        'id': 'w1',
        'userId': 'u1',
        'name': 'Full body',
        'days': [
          {'id': 'd1', 'name': 'Day A', 'dayNumber': 1, 'exercises': []},
        ],
        'createdAt': '2026-01-01T00:00:00.000Z',
        'updatedAt': '2026-01-02T12:00:00.000Z',
      });

      expect(model.id, 'w1');
      expect(model.days.single.name, 'Day A');
      expect(model.createdAt, createdAt);
      expect(model.updatedAt, updatedAt);
    });

    test('fromJson throws when a required date is missing', () {
      expect(
        () => WorkoutModel.fromJson({
          'id': 'w1',
          'userId': 'u1',
          'name': 'Broken',
          'days': [],
          'updatedAt': '2026-01-02T12:00:00.000Z',
        }),
        throwsA(isA<TypeError>()),
      );
    });

    test('entity conversion round-trips the whole tree', () {
      final workout = buildWorkout();

      expect(WorkoutModel.fromEntity(workout).toEntity(), workout);
    });

    test('survives a JSON encode/decode round-trip', () {
      final workout = buildWorkout();
      final json =
          jsonDecode(jsonEncode(WorkoutModel.fromEntity(workout).toJson()))
              as Map<String, dynamic>;

      expect(WorkoutModel.fromJson(json).toEntity(), workout);
    });
  });
}
