import 'package:fit_flow/core/theme/app_theme.dart';
import 'package:fit_flow/features/workouts/presentation/widgets/target_update_dialog.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../goldens/golden_helpers.dart';

/// Opens the dialog from a button and returns a getter for what it popped.
Future<ExerciseTarget? Function()> _open(
  WidgetTester tester, {
  bool showWeight = false,
}) async {
  ExerciseTarget? result;
  await tester.pumpWidget(
    MaterialApp(
      theme: AppTheme.darkTheme,
      home: Builder(
        builder: (context) => TextButton(
          onPressed: () async {
            result = await showDialog<ExerciseTarget>(
              context: context,
              builder: (_) => TargetUpdateDialog(
                exerciseName: 'Dips',
                current: const ExerciseTarget(3, 7, 20),
                suggested: const ExerciseTarget(3, 5, 22.5),
                doneReps: const [7, 7, 5],
                showWeight: showWeight,
              ),
            );
          },
          child: const Text('open'),
        ),
      ),
    ),
  );
  await settleFonts(tester);
  await tester.tap(find.text('open'));
  await settleFonts(tester);
  return () => result;
}

void main() {
  test('suggests the sets done at the lowest reps reached', () {
    final target = ExerciseTarget.suggestFrom([7, 7, 5]);

    expect(target.sets, 3);
    expect(target.reps, 5);
    expect(target.weight, isNull);
  });

  test('suggests the heaviest weight used', () {
    final target = ExerciseTarget.suggestFrom([5, 5], [100, null, 102.5]);

    expect(target.weight, 102.5);
  });

  test('prints the target with kg only when it has a weight', () {
    expect('${const ExerciseTarget(3, 5)}', '3 × 5');
    expect('${const ExerciseTarget(3, 5, 60)}', '3 × 5 · 60 kg');
  });

  testWidgets('shows what was done and the suggestion', (tester) async {
    await _open(tester);

    expect(find.text('Done: 7 · 7 · 5'), findsOneWidget);
    expect(find.text('Target: 3 × 7 · 20 kg'), findsOneWidget);
    expect(find.text('Kg'), findsNothing);
    expect(find.text('5'), findsOneWidget);
  });

  testWidgets('Update returns the adjusted target', (tester) async {
    final result = await _open(tester);

    await tester.tap(find.byTooltip('More Reps'));
    await tester.tap(find.byTooltip('More Sets'));
    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();

    expect(result()?.sets, 4);
    expect(result()?.reps, 6);
    expect(result()?.weight, isNull);
  });

  testWidgets('Keep returns nothing', (tester) async {
    final result = await _open(tester);

    await tester.tap(find.text('Keep'));
    await tester.pumpAndSettle();

    expect(result(), isNull);
  });

  testWidgets('weight row steps by 2.5 kg', (tester) async {
    final result = await _open(tester, showWeight: true);

    expect(find.text('22.5'), findsOneWidget);
    await tester.tap(find.byTooltip('More Kg'));
    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();

    expect(result()?.weight, 25);
  });
}
