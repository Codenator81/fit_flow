# Roadmap

!!! note "Everything on this page is planned, not built"
    Items move into the [changelog](../changelog.md) when their pull request is merged. The live backlog is [GitHub Issues](https://github.com/Codenator81/fit_flow/issues): every piece of work starts as an issue there.

## Next up

- [ ] **Fix the "Continue with Google" button overflow on narrow (~320 dp) screens.** Known bug; needs an issue with a screenshot and a fix PR.
- [ ] **Remember the selected current program.** Settings has a program selector, but the choice is not saved yet; Home always shows the most recently created program.
- [ ] **Regenerate Freezed code.** `freezed` was upgraded to 4.0.2 without re-running `build_runner`; the next change to models regenerates and commits the `.freezed.dart` files.

## Later

- [ ] **Progress charts** with `fl_chart` (the dependency is already declared): volume per week and per-exercise trends from the stored history.
- [ ] **Declarative routing with `go_router`** (declared, not used yet) for named routes and deep links; today the app uses `Navigator` with one named route (`/settings`).
- [ ] **Sound at the end of the rest timer**; `assets/sounds/` holds only a placeholder, the timer vibrates today.
- [ ] **Longer history** than the last five sessions per exercise.

## Not planned yet

- iOS and web builds (the repository has only the `android/` platform folder).
- Exercise images or videos (would need Firebase Storage, which is not on the free plan).
