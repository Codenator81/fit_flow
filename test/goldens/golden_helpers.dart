import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Phone-sized logical viewport (390x844, like an iPhone 14).
const goldenPhoneSize = Size(390, 844);

/// Renders [app] in a phone-sized viewport and compares it with
/// `test/goldens/screens/<name>.png`.
///
/// Run `flutter test --update-goldens test/goldens` to (re)write the PNGs.
Future<void> expectScreenGolden(
  WidgetTester tester,
  Widget app,
  String name,
) async {
  tester.view.physicalSize = goldenPhoneSize * 3;
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);

  // Tests draw shadows as solid outlines by default; render the real glow.
  debugDisableShadows = false;
  try {
    await tester.pumpWidget(app);
    // Let google_fonts finish loading the bundled font files.
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 100)),
    );
    await tester.pumpAndSettle();
    await expectLater(
      find.byWidget(app),
      matchesGoldenFile('screens/$name.png'),
    );
  } finally {
    debugDisableShadows = true;
  }
}
