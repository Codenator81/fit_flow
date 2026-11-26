import 'package:fit_flow/core/theme/app_theme.dart';
import 'package:fit_flow/features/workouts/presentation/widgets/set_row.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../goldens/golden_helpers.dart';

Future<void> _pump(WidgetTester tester, Widget child) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: AppTheme.darkTheme,
      home: Scaffold(body: child),
    ),
  );
  await settleFonts(tester);
}

SetRow _row({
  double? weight,
  bool showWeight = true,
  ValueChanged<int>? onRepsChanged,
  VoidCallback? onWeightTap,
}) => SetRow(
  setNumber: 1,
  reps: 5,
  weight: weight,
  showWeight: showWeight,
  completed: false,
  onCompletedChanged: (_) {},
  onRepsChanged: onRepsChanged ?? (_) {},
  onWeightTap: onWeightTap ?? () {},
  onDelete: () {},
);

void main() {
  test('formatWeight drops .0 and keeps fractions', () {
    expect(formatWeight(60), '60');
    expect(formatWeight(62.5), '62.5');
  });

  testWidgets('shows the weight and reports taps', (tester) async {
    var tapped = false;
    await _pump(tester, _row(weight: 102.5, onWeightTap: () => tapped = true));

    expect(find.text('102.5'), findsOneWidget);
    await tester.tap(find.text('102.5'));
    expect(tapped, isTrue);
  });

  testWidgets('an empty weight shows a dash', (tester) async {
    await _pump(tester, _row());

    expect(find.text('—'), findsOneWidget);
  });

  testWidgets('hides the weight when the exercise does not track it', (
    tester,
  ) async {
    await _pump(tester, _row(showWeight: false));
    await _pump(tester, const SetRowHeader(showWeight: false));

    expect(find.text('—'), findsNothing);
    expect(find.text('KG'), findsNothing);
    expect(find.text('REPS'), findsOneWidget);
  });

  testWidgets('plus and minus change the reps by one', (tester) async {
    final changes = <int>[];
    await _pump(tester, _row(onRepsChanged: changes.add));

    await tester.tap(find.byTooltip('More reps'));
    await tester.tap(find.byTooltip('Fewer reps'));

    expect(changes, [6, 4]);
  });
}
