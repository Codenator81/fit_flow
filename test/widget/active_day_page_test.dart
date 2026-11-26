import 'package:fit_flow/core/theme/app_theme.dart';
import 'package:fit_flow/features/workouts/domain/entities/exercise.dart';
import 'package:fit_flow/features/workouts/domain/entities/workout.dart';
import 'package:fit_flow/features/workouts/domain/entities/workout_day.dart';
import 'package:fit_flow/features/workouts/presentation/pages/active_day_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../goldens/golden_helpers.dart';

const _day = WorkoutDay(
  id: 'd1',
  name: 'Push',
  dayNumber: 1,
  isActive: true,
  exercises: [Exercise(id: 'dips', name: 'Dips', sets: 2, reps: 7)],
);

final _workout = Workout(
  id: 'w1',
  userId: 'u1',
  name: 'Program',
  days: const [_day],
  createdAt: DateTime(2026, 11, 1),
  updatedAt: DateTime(2026, 11, 1),
);

Future<void> _pumpPage(WidgetTester tester) async {
  tester.view.physicalSize = const Size(390, 1600) * 3;
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    MaterialApp(
      theme: AppTheme.darkTheme,
      home: ActiveDayPage(workout: _workout, day: _day),
    ),
  );
  await settleFonts(tester);
}

void main() {
  testWidgets('Add Set starts from the reps of the last set', (tester) async {
    await _pumpPage(tester);

    await tester.tap(find.byTooltip('Fewer reps').last);
    await tester.tap(find.text('Add Set'));
    await tester.pumpAndSettle();

    expect(find.text('6'), findsNWidgets(2));
  });

  testWidgets('finishing below target offers a new target', (tester) async {
    await _pumpPage(tester);

    await tester.tap(find.byTooltip('Fewer reps').last);
    await tester.pump();
    for (final box in find.byType(Checkbox).evaluate().toList()) {
      await tester.tap(find.byWidget(box.widget));
      await tester.pump();
    }
    await tester.pumpAndSettle();

    expect(find.text('New target?'), findsOneWidget);
    expect(find.text('Done: 7 · 6'), findsOneWidget);

    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();

    expect(find.text('Next time: 2 × 6'), findsOneWidget);
  });

  testWidgets('finishing on target asks nothing', (tester) async {
    await _pumpPage(tester);

    for (final box in find.byType(Checkbox).evaluate().toList()) {
      await tester.tap(find.byWidget(box.widget));
      await tester.pump();
    }
    await tester.pumpAndSettle();

    expect(find.text('New target?'), findsNothing);
  });
}
