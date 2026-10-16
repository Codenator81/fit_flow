<!-- Every PR starts from a GitHub issue; keep this line so merging closes it. -->
Closes #

## Summary

<!-- 3-5 bullets a reviewer can read in 30 seconds: what changed for the
     user or the project, and why. Plain language, not a list of files. -->

-

## Why

<!-- Context beyond the summary: link the issue or thread, alternatives considered. -->

## How tested

<!-- Commands you ran, devices/emulators, manual steps. -->

- [ ] `flutter test`
- [ ] Ran the app on a device or emulator

## Screenshots

<!-- Before / after for any UI change. Delete this section if there is no UI change.
     Embed the golden PNG from the PR branch so it shows inline:
     <img src="https://github.com/Codenator81/fit_flow/blob/<branch>/test/goldens/screens/<name>.png?raw=true" width="300">
     CI also comments changed goldens on the PR, and the Emulator tests
     workflow comments its emulator screenshots. -->

## Checklist

- [ ] `dart format .` produces no changes
- [ ] `flutter analyze --fatal-infos` is clean
- [ ] Tests added or updated for new logic
- [ ] `build_runner` re-run if models or states changed
- [ ] Follows CLAUDE.md conventions (bloc, freezed, get_it, AppColors/AppTextStyles)
- [ ] No secrets or API keys committed
