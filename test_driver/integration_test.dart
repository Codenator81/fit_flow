import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

/// Host-side driver for `flutter drive`: saves every screenshot taken with
/// `binding.takeScreenshot(name)` to `build/screenshots/<name>.png`.
Future<void> main() {
  return integrationDriver(
    onScreenshot: (name, bytes, [args]) async {
      final file = File('build/screenshots/$name.png');
      await file.create(recursive: true);
      await file.writeAsBytes(bytes);
      return true;
    },
  );
}
