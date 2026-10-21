# Getting started

## Requirements

| Tool | Version |
|---|---|
| Flutter | **3.47.7** (pinned in `pubspec.yaml` under `environment.flutter`; CI reads it from there) |
| Android SDK | API 36 platform tools; an emulator or a phone with USB debugging |
| Java | 17 or newer (CI uses 17) |
| Firebase CLI | Only to deploy Firestore rules and indexes |

Android is the only platform in the repository. The Gradle setup is Gradle 9.3.1, Android Gradle Plugin 9.1.0 and Kotlin 2.4.0.

## Run the app

```bash
git clone https://github.com/Codenator81/fit_flow.git
cd fit_flow
flutter pub get
flutter run            # on a connected device or running emulator
```

The app uses the Firebase project `fitflow-54711` through the committed `android/app/google-services.json`. To sign in with Google from a new machine, register that machine's debug key fingerprints first: see [Google sign-in on Android](../architecture/firebase.md#google-sign-in-on-android).

## Everyday commands

=== "Check before pushing"

    ```bash
    flutter pub get
    dart format .
    flutter analyze --fatal-infos
    flutter test
    ```

=== "Regenerate code"

    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

    Run after changing a Freezed entity, a bloc event or state, or a JSON model. Commit the generated files.

=== "Update screenshots"

    ```bash
    flutter test --update-goldens test/goldens
    ```

    Then review and commit the changed PNGs in `test/goldens/screens/`.

=== "Build an APK"

    ```bash
    flutter build apk --debug
    ```

    CI builds the same debug APK on every pull request and keeps it as a workflow artifact for 14 days.

=== "Preview this site"

    ```bash
    pip install -r docs/requirements.txt
    mkdocs serve
    ```

    Opens the documentation at <http://127.0.0.1:8000> and reloads on every change.

## Project layout

```text
android/            Android app (Gradle, google-services.json)
assets/             App assets (sound placeholder)
docs/               This documentation site (MkDocs)
google_fonts/       Bundled font files used by the app and the tests
integration_test/   Tests that run on an Android emulator
lib/                App source (see Architecture)
test/               Unit, widget and golden tests, fakes
test_driver/        Host driver that saves emulator screenshots
tool/               Helper scripts (font download, MkDocs hook)
firestore.rules     Firestore security rules
mkdocs.yml          Documentation site configuration
```
