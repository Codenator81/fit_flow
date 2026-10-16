import 'package:fit_flow/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/// Smoke test on a real device or emulator: launches the full app (including
/// Firebase) and saves a screenshot of the first screen a signed-out user
/// sees. Run via `flutter drive` with `test_driver/integration_test.dart`.
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('app launches to the login screen', (tester) async {
    app.main();
    // Firebase init and the first auth state event take a moment.
    await _pumpUntilFound(tester, find.byType(TextField));

    expect(find.byType(TextField), findsWidgets);

    // Android renders through a platform surface that must be converted
    // before a screenshot can be taken.
    await binding.convertFlutterSurfaceToImage();
    await tester.pumpAndSettle();
    await binding.takeScreenshot('login');
  });
}

Future<void> _pumpUntilFound(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 30),
}) async {
  final end = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(end)) {
    await tester.pump(const Duration(milliseconds: 250));
    if (finder.evaluate().isNotEmpty) return;
  }
  throw TestFailure('Timed out waiting for $finder');
}
