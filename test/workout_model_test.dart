import 'package:fit_flow/features/workouts/data/models/workout_model.dart';
import 'package:flutter_test/flutter_test.dart';

// Smoke test so the CI test job has something real to run: the Firestore
// document shape must map to the domain entity and back without loss.
void main() {
  final json = <String, dynamic>{
    'id': 'w1',
    'userId': 'user-123',
    'name': 'Push Pull Legs',
    'createdAt': '2026-10-01T10:00:00.000',
    'updatedAt': '2026-10-02T10:00:00.000',
    'days': [
      {
        'id': 'd1',
        'name': 'Push',
        'dayNumber': 1,
        'exercises': [
          {'id': 'e1', 'name': 'Bench Press', 'sets': 4, 'reps': 8},
        ],
      },
      {
        'id': 'd2',
        'name': 'Rest',
        'dayNumber': 2,
        'exercises': <dynamic>[],
        'isRestDay': true,
      },
    ],
  };

  group('WorkoutModel', () {
    test('fromJson maps a Firestore document to the entity', () {
      final workout = WorkoutModel.fromJson(json).toEntity();

      expect(workout.id, 'w1');
      expect(workout.userId, 'user-123');
      expect(workout.days, hasLength(2));
      expect(workout.days.first.exercises.single.name, 'Bench Press');
      expect(workout.days.first.exercises.single.restSeconds, 60);
      expect(workout.days.last.isRestDay, isTrue);
      expect(workout.createdAt, DateTime(2026, 10, 1, 10));
    });

    test('fromEntity round-trips to an equal entity', () {
      final entity = WorkoutModel.fromJson(json).toEntity();

      expect(WorkoutModel.fromEntity(entity).toEntity(), entity);
    });
  });
}
