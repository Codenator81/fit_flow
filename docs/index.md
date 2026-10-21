---
title: FitFlow
description: Offline-first workout tracker built with Flutter and Firebase.
hide:
  - navigation
  - toc
---

<div class="ff-hero" markdown>

# FitFlow

<p class="ff-tagline">Plan your training program, run each day set by set with a rest timer, and keep your progress in sync across devices, even offline.</p>

[Product spec](product/index.md){ .md-button .md-button--primary }
[Architecture](architecture/index.md){ .md-button }
[View on GitHub :fontawesome-brands-github:](https://github.com/Codenator81/fit_flow){ .md-button }

</div>

<div class="ff-screens" markdown>
<figure markdown>
![Login screen](assets/screens/login_page.png)
<figcaption>Sign in with Google</figcaption>
</figure>
<figure markdown>
![Home screen](assets/screens/home.png)
<figcaption>Home: current program</figcaption>
</figure>
<figure markdown>
![Workout detail](assets/screens/workout_detail.png)
<figcaption>Program days</figcaption>
</figure>
<figure markdown>
![Active day](assets/screens/active_day.png)
<figcaption>Active day: sets and rest timer</figcaption>
</figure>
<figure markdown>
![Settings](assets/screens/settings.png)
<figcaption>Settings: manage programs</figcaption>
</figure>
</div>

## What FitFlow does

<div class="grid cards" markdown>

-   :material-calendar-month:{ .lg .middle } __Custom programs__

    ---

    Build a program out of training days and rest days, add exercises with target sets, reps and rest time.

-   :material-play-circle:{ .lg .middle } __Day-by-day flow__

    ---

    The app always knows which day is next. Finish a day and the next one becomes active; start over at any time.

-   :material-timer-outline:{ .lg .middle } __Sets and rest timer__

    ---

    Tick off each set, adjust the reps you actually did, and start a rest timer that vibrates when time is up.

-   :material-chart-line:{ .lg .middle } __Exercise history__

    ---

    Every completed day stores the result per exercise; long-press an exercise to see your last five sessions.

-   :material-cloud-sync:{ .lg .middle } __Offline-first sync__

    ---

    Cloud Firestore with unlimited offline cache: train without signal, changes sync when you are back online.

-   :material-shield-lock:{ .lg .middle } __Private by default__

    ---

    Google sign-in, and Firestore security rules let each user read and write only their own workouts.

</div>

## Built with

| Layer | Technology |
|---|---|
| App | Flutter 3.47 (Android), Material 3 dark theme, Google Fonts (Montserrat, Roboto, Bebas Neue) |
| State | `flutter_bloc` (`WorkoutBloc`) over repository interfaces |
| Models | Freezed (entities, events, states) and `json_serializable` (Firestore models) |
| Dependency injection | `get_it` service locator |
| Backend | Firebase Auth (Google) and Cloud Firestore with offline persistence |
| Quality | Unit tests, golden screenshot tests, Android emulator tests, GitHub Actions CI |

!!! info "Where these docs live"
    This site is built from the [`docs/`](https://github.com/Codenator81/fit_flow/tree/master/docs) folder of the repository with MkDocs Material and published to GitHub Pages on every merge to `master`. The screenshots on this site are the golden images the test suite verifies, so they always match the current app.
