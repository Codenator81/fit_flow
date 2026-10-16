import 'package:fit_flow/features/workouts/domain/entities/workout.dart';
import 'package:fit_flow/features/workouts/domain/entities/workout_day.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Workout', () {
    final workout = Workout(
      id: 'w1',
      userId: 'u1',
      name: 'Full body',
      days: const [
        WorkoutDay(id: 'd1', name: 'Day A', dayNumber: 1, exercises: []),
      ],
      createdAt: DateTime.utc(2026, 1, 1),
      updatedAt: DateTime.utc(2026, 1, 1),
    );

    test('has value equality', () {
      expect(workout, workout.copyWith());
      expect(workout.hashCode, workout.copyWith().hashCode);
    });

    test('copyWith renames without touching other fields', () {
      final renamed = workout.copyWith(name: 'Upper/Lower');

      expect(renamed.name, 'Upper/Lower');
      expect(renamed.id, workout.id);
      expect(renamed.days, workout.days);
      expect(renamed, isNot(workout));
    });
  });
}
