import 'package:fit_flow/core/theme/app_theme.dart';
import 'package:fit_flow/features/workouts/domain/entities/exercise.dart';
import 'package:fit_flow/features/workouts/domain/entities/workout.dart';
import 'package:fit_flow/features/workouts/domain/entities/workout_day.dart';
import 'package:fit_flow/features/workouts/presentation/pages/active_day_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'golden_helpers.dart';

final _day = WorkoutDay(
  id: 'day-2',
  name: 'Pull',
  dayNumber: 2,
  isActive: true,
  exercises: [
    Exercise(
      id: 'pull-ups',
      name: 'Pull-ups',
      sets: 3,
      reps: 8,
      history: [
        ExerciseCompletion(date: DateTime(2026, 10, 9), maxSets: 3, maxReps: 8),
      ],
    ),
    const Exercise(id: 'rows', name: 'Barbell Rows', sets: 3, reps: 10),
  ],
);

final _workout = Workout(
  id: 'workout-1',
  userId: 'user-1',
  name: 'Push Pull Legs',
  days: [_day],
  createdAt: DateTime(2026, 10, 1),
  updatedAt: DateTime(2026, 10, 1),
);

Widget _app() => MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: AppTheme.darkTheme,
  home: ActiveDayPage(workout: _workout, day: _day),
);

void main() {
  testWidgets('ActiveDayPage matches golden', (tester) async {
    await expectScreenGolden(tester, _app(), 'active_day');
  });

  // A RenderFlex overflow is reported as a test failure, so pumping the page
  // at a narrow phone width is enough to guard against regressions (#16).
  testWidgets('ActiveDayPage does not overflow at 320 dp', (tester) async {
    tester.view.physicalSize = const Size(320, 640) * 3;
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(_app());
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });
}
