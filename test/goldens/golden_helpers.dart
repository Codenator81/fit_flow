import 'package:flutter/material.dart';
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
  await withRealShadows(() async {
    await pumpPhoneScreen(tester, app);
    await expectCurrentScreenGolden(tester, name);
  });
}

/// Golden test body that renders real shadows. The flag must be restored
/// before the test ends (Flutter checks it before tear-downs run).
void testScreenGolden(String description, WidgetTesterCallback body) {
  testWidgets(description, (tester) => withRealShadows(() => body(tester)));
}

/// Tests draw shadows as solid outlines by default; render the real glow.
Future<void> withRealShadows(Future<void> Function() body) async {
  debugDisableShadows = false;
  try {
    await body();
  } finally {
    debugDisableShadows = true;
  }
}

/// Pumps [app] in a phone-sized viewport with fonts loaded, ready for taps
/// and [expectCurrentScreenGolden] calls.
Future<void> pumpPhoneScreen(WidgetTester tester, Widget app) async {
  tester.view.physicalSize = goldenPhoneSize * 3;
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(app);
  await settleFonts(tester);
}

/// Lets google_fonts finish loading the bundled font files (they load
/// asynchronously the first time a style is used, e.g. on a new screen).
Future<void> settleFonts(WidgetTester tester) async {
  // Lay out the new screen first so its fonts start loading.
  await tester.pumpAndSettle();
  await tester.runAsync(
    () => Future<void>.delayed(const Duration(milliseconds: 100)),
  );
  await tester.pumpAndSettle();
}

/// Compares whatever is on screen now with `test/goldens/screens/<name>.png`.
Future<void> expectCurrentScreenGolden(WidgetTester tester, String name) async {
  await settleFonts(tester);
  await expectLater(
    find.byType(MaterialApp).first,
    matchesGoldenFile('screens/$name.png'),
  );
}
