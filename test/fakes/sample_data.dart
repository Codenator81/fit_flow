import 'package:fit_flow/features/workouts/domain/entities/exercise.dart';
import 'package:fit_flow/features/workouts/domain/entities/workout.dart';
import 'package:fit_flow/features/workouts/domain/entities/workout_day.dart';

final _date = DateTime.utc(2026, 10, 1);

Exercise _exercise(String id, String name, int sets, int reps, {int? last}) =>
    Exercise(
      id: id,
      name: name,
      sets: sets,
      reps: reps,
      restSeconds: 90,
      history: [
        if (last != null)
          ExerciseCompletion(date: _date, maxSets: sets, maxReps: last),
      ],
    );

/// A realistic program for screenshots: one finished day, the active day,
/// a rest day and an upcoming day.
final samplePushPullLegs = Workout(
  id: 'ppl',
  userId: 'test-user',
  name: 'Push Pull Legs',
  createdAt: _date,
  updatedAt: _date,
  days: [
    WorkoutDay(
      id: 'push',
      name: 'Push',
      dayNumber: 1,
      isCompleted: true,
      completedDate: _date,
      exercises: [
        _exercise('bench', 'Bench Press', 4, 8, last: 8),
        _exercise('ohp', 'Overhead Press', 3, 10, last: 9),
        _exercise('dips', 'Dips', 3, 12, last: 12),
      ],
    ),
    WorkoutDay(
      id: 'pull',
      name: 'Pull',
      dayNumber: 2,
      isActive: true,
      exercises: [
        _exercise('deadlift', 'Deadlift', 3, 5, last: 5),
        _exercise('pullups', 'Pull-ups', 4, 8, last: 7),
        _exercise('rows', 'Barbell Row', 3, 10),
      ],
    ),
    const WorkoutDay(
      id: 'rest',
      name: 'Rest',
      dayNumber: 3,
      isRestDay: true,
      exercises: [],
    ),
    WorkoutDay(
      id: 'legs',
      name: 'Legs',
      dayNumber: 4,
      exercises: [
        _exercise('squat', 'Back Squat', 5, 5),
        _exercise('rdl', 'Romanian Deadlift', 3, 10),
      ],
    ),
  ],
);
