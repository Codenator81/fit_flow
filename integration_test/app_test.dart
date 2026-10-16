import 'package:fit_flow/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/fakes/fake_dependencies.dart';
import '../test/fakes/sample_data.dart';

/// Smoke tests on a real device or emulator. Screenshots are saved by
/// `test_driver/integration_test.dart`; run via `flutter drive`.
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  var surfaceConverted = false;

  Future<void> takeScreenshot(WidgetTester tester, String name) async {
    // Android renders through a platform surface that must be converted
    // (once per run) before a screenshot can be taken.
    if (!surfaceConverted) {
      await binding.convertFlutterSurfaceToImage();
      surfaceConverted = true;
    }
    await tester.pumpAndSettle();
    await binding.takeScreenshot(name);
  }

  testWidgets('app launches to the login screen', (tester) async {
    // The full app, including Firebase.
    app.main();
    // Firebase init and the first auth state event take a moment.
    final signIn = find.text('Continue with Google');
    await _pumpUntilFound(tester, signIn);

    expect(signIn, findsOneWidget);
    await takeScreenshot(tester, 'login');
  });

  testWidgets('signed-in user sees home (fake auth and data)', (tester) async {
    // Google sign-in can't run unattended, so this test swaps Firebase for
    // the in-memory fakes used by the golden tests.
    await registerFakeDependencies(workouts: [samplePushPullLegs]);
    await tester.pumpWidget(const app.MainApp());
    await _pumpUntilFound(tester, find.text('START WORKOUT'));
    await takeScreenshot(tester, 'home');

    await tester.tap(find.text('START WORKOUT'));
    await _pumpUntilFound(tester, find.text('WORKOUT DAYS'));
    await takeScreenshot(tester, 'workout_detail');

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.more_vert));
    await _pumpUntilFound(tester, find.text('Logout'));
    await takeScreenshot(tester, 'settings');
  });
}

Future<void> _pumpUntilFound(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 60),
}) async {
  final end = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(end)) {
    await tester.pump(const Duration(milliseconds: 250));
    if (finder.evaluate().isNotEmpty) return;
  }
  throw TestFailure('Timed out waiting for $finder');
}
