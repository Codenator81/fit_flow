import 'package:fit_flow/features/workouts/domain/entities/exercise.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Exercise', () {
    test('defaults restSeconds to 60 and history to empty', () {
      const exercise = Exercise(id: 'e1', name: 'Squat', sets: 3, reps: 10);

      expect(exercise.restSeconds, 60);
      expect(exercise.history, isEmpty);
    });

    test('has value equality', () {
      const a = Exercise(id: 'e1', name: 'Squat', sets: 3, reps: 10);
      const b = Exercise(id: 'e1', name: 'Squat', sets: 3, reps: 10);

      expect(a, b);
      expect(a.hashCode, b.hashCode);
    });

    test('copyWith changes only the given fields', () {
      const exercise = Exercise(id: 'e1', name: 'Squat', sets: 3, reps: 10);

      final updated = exercise.copyWith(reps: 12, restSeconds: 90);

      expect(updated.reps, 12);
      expect(updated.restSeconds, 90);
      expect(updated.sets, 3);
      expect(updated.name, 'Squat');
      expect(exercise.reps, 10);
    });

    test('copyWith can append to history', () {
      const exercise = Exercise(id: 'e1', name: 'Squat', sets: 3, reps: 10);
      final completion = ExerciseCompletion(
        date: DateTime.utc(2026, 1, 1),
        maxSets: 3,
        maxReps: 11,
      );

      final updated = exercise.copyWith(
        history: [...exercise.history, completion],
      );

      expect(updated.history, [completion]);
      expect(exercise.history, isEmpty);
    });
  });

  group('ExerciseCompletion', () {
    test('has value equality', () {
      final date = DateTime.utc(2026, 1, 1);

      expect(
        ExerciseCompletion(date: date, maxSets: 3, maxReps: 10),
        ExerciseCompletion(date: date, maxSets: 3, maxReps: 10),
      );
    });
  });
}
