import 'package:fit_flow/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fakes/fake_dependencies.dart';
import '../fakes/sample_data.dart';
import 'golden_helpers.dart';

/// Screens behind the login. The real app (`MainApp` with `AuthGate`) starts
/// already signed in through the fake auth repository, with workouts served
/// from memory, so no Firebase or Google sign-in is needed.
void main() {
  testScreenGolden('home with no workouts', (tester) async {
    await registerFakeDependencies();
    await pumpPhoneScreen(tester, const MainApp());

    await expectCurrentScreenGolden(tester, 'home_empty');
  });

  testScreenGolden('home, workout and settings', (tester) async {
    await registerFakeDependencies(workouts: [samplePushPullLegs]);
    await pumpPhoneScreen(tester, const MainApp());
    await expectCurrentScreenGolden(tester, 'home');

    await tester.tap(find.text('START WORKOUT'));
    await expectCurrentScreenGolden(tester, 'workout_detail');

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.more_vert));
    await expectCurrentScreenGolden(tester, 'settings');
  });
}
