# Changelog

Notable changes, newest first. Each entry links to its pull request.

## 2026-11-26 · Toolchain upgrade

### Changed
- Flutter 3.50.1 / Dart 3.14 with `material_ui`; all dependencies at their latest majors, google_sign_in 7; Android on Gradle 9.9.2, AGP 9.5.3 and Kotlin 2.4.21; the rest timer is removed (button, rest-time field, `restSeconds`, `vibration`) ([#32](https://github.com/Codenator81/fit_flow/pull/32)).

### Added
- Optional weight per set (**Track weight** when adding an exercise), a **New target?** dialog after finishing an exercise off target (sets, reps, kg), SET / REPS / KG column titles on the active day; **Add Set** copies the last set ([#32](https://github.com/Codenator81/fit_flow/pull/32)).

## 2026-10-16 · Quality foundation

### Fixed
- Active day: set rows no longer overflow on narrow screens; added an overflow test at 320 dp ([#18](https://github.com/Codenator81/fit_flow/pull/18), closes [#16](https://github.com/Codenator81/fit_flow/issues/16)).

### Added
- Dependency injection with `get_it`, an `AuthRepository`, and test fakes, so golden tests cover the screens behind the login: Home, Program, Active day, Settings ([#17](https://github.com/Codenator81/fit_flow/pull/17), closes [#15](https://github.com/Codenator81/fit_flow/issues/15)).
- Screenshots inside pull requests (before/after comment for goldens, emulator screenshots comment) and a Summary section in the PR template ([#11](https://github.com/Codenator81/fit_flow/pull/11), closes [#12](https://github.com/Codenator81/fit_flow/issues/12)).
- Emulator tests workflow: the app runs on an Android API 34 emulator with screenshots ([#10](https://github.com/Codenator81/fit_flow/pull/10)).
- Golden screenshot tooling with bundled fonts ([#3](https://github.com/Codenator81/fit_flow/pull/3)).
- Unit tests for models, entities and `WorkoutBloc` ([#2](https://github.com/Codenator81/fit_flow/pull/2)).
- CI on GitHub Actions: format, analyze, test with coverage comment, debug APK build; Dependabot; CODEOWNERS ([#1](https://github.com/Codenator81/fit_flow/pull/1)).

### Changed
- Android build upgraded to Gradle 9.3.1, AGP 9.1.0 and Kotlin 2.4.0 ([#13](https://github.com/Codenator81/fit_flow/pull/13), closes [#14](https://github.com/Codenator81/fit_flow/issues/14)).
- Analyzer excludes committed so `flutter analyze` leaves the tree clean ([#9](https://github.com/Codenator81/fit_flow/pull/9)).
- Dependencies: `intl` 0.20.3 ([#4](https://github.com/Codenator81/fit_flow/pull/4)), `freezed` 4.0.2 ([#5](https://github.com/Codenator81/fit_flow/pull/5)), `vibration` 3.2.1 ([#8](https://github.com/Codenator81/fit_flow/pull/8)).

## 2025-12 – 2026-01 · First version

- Project setup: Flutter, Firebase, dark orange theme and the dependency stack.
- Google sign-in, workout programs with training and rest days, exercises with sets, reps and rest time.
- Active day screen with per-set tracking, a vibrating rest timer and exercise history.
