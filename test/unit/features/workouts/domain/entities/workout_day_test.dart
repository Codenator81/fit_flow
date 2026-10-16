import 'package:fit_flow/features/workouts/domain/entities/workout_day.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WorkoutDay', () {
    const day = WorkoutDay(id: 'd1', name: 'Legs', dayNumber: 1, exercises: []);

    test('defaults flags to false and completedDate to null', () {
      expect(day.isRestDay, isFalse);
      expect(day.isCompleted, isFalse);
      expect(day.isActive, isFalse);
      expect(day.completedDate, isNull);
    });

    test('copyWith marks the day completed', () {
      final date = DateTime.utc(2026, 5, 1);

      final completed = day.copyWith(isCompleted: true, completedDate: date);

      expect(completed.isCompleted, isTrue);
      expect(completed.completedDate, date);
      expect(completed.name, 'Legs');
    });

    test('copyWith can clear completedDate back to null', () {
      final completed = day.copyWith(completedDate: DateTime.utc(2026, 5, 1));

      expect(completed.copyWith(completedDate: null).completedDate, isNull);
    });

    test('has value equality including the exercises list', () {
      expect(
        day,
        const WorkoutDay(id: 'd1', name: 'Legs', dayNumber: 1, exercises: []),
      );
      expect(day, isNot(day.copyWith(isActive: true)));
    });
  });
}
