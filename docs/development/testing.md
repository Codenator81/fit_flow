# Testing

```bash
flutter test                 # everything in test/
flutter test test/unit       # only unit tests
flutter test test/goldens    # only screenshot tests
```

| Kind | Where | What it covers |
|---|---|---|
| Unit | `test/unit/` | JSON models, entities, `WorkoutBloc` event → state flows |
| Widget | `test/widget/` | `AuthGate` switching between login and home |
| Golden (screenshot) | `test/goldens/` | Every screen at phone size, compared pixel by pixel |
| Integration | `integration_test/` | The real app on an Android emulator, with screenshots |

## Fakes instead of Firebase

`test/fakes/` replaces Firebase so tests are fast and need no network:

- `FakeAuthRepository`: a signed-in test user (or signed out).
- `FakeWorkoutRepository`: workouts kept in memory.
- `sample_data.dart`: a realistic **Push Pull Legs** program (one finished day, the active day, a rest day and an upcoming day).
- `registerFakeDependencies(workouts: [...])`: resets `sl` and registers the fakes plus the real blocs.

```dart
await registerFakeDependencies(workouts: [samplePushPullLegs]);
await pumpPhoneScreen(tester, const MainApp());   // lands on Home, signed in
```

## Golden screenshot tests

Goldens render the real widgets at 390 × 844 logical pixels (pixel ratio 3) and compare them with the PNGs in `test/goldens/screens/`.

- Screens behind the login use the fakes above and navigate by tapping, like a user: see `test/goldens/signed_in_screens_golden_test.dart`.
- `testScreenGolden(...)` and `expectCurrentScreenGolden(tester, name)` (in `golden_helpers.dart`) render real shadows and wait for fonts.
- `test/flutter_test_config.dart` disables font downloads and loads Material Icons, so text and icons render exactly as in the app. Fonts come from `google_fonts/`.
- The active day also has an overflow test at 320 dp width.

**When you change UI:**

1. `flutter test --update-goldens test/goldens`
2. Look at the changed PNGs and commit them.
3. In the pull request, CI posts a **Screens changed in this PR** comment with before/after images.

!!! tip "Missing font variant"
    If a test fails with *Ensure &lt;Font&gt;-&lt;Variant&gt;.ttf exists*, download that variant into `google_fonts/`:
    `python3 tool/fetch_google_font.py roboto:500`

!!! tip "A new screen behind the login"
    Add a `testScreenGolden` that starts from `registerFakeDependencies`, pumps `MainApp`, taps to the screen and calls `expectCurrentScreenGolden`.

## Emulator (integration) tests

`integration_test/app_test.dart` runs on an Android emulator:

1. The full app with Firebase launches to the login screen.
2. With fakes registered, a signed-in user goes Home → program → Settings.

Each step saves a screenshot (`login`, `home`, `workout_detail`, `settings`) through `test_driver/integration_test.dart` into `build/screenshots/`. Run locally with an emulator started:

```bash
flutter drive --driver=test_driver/integration_test.dart \
  --target=integration_test/app_test.dart
```

On GitHub this runs in the [Emulator tests workflow](ci.md#emulator-tests).
