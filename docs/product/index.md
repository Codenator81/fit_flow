# Product specification

## Purpose

FitFlow is a mobile workout tracker for people who follow a repeating training program (for example Push / Pull / Legs). It replaces the notebook or spreadsheet: the program lives in the app, the app tells you which day is next, and each session is logged set by set.

## Target users

- **Gym-goers on a split program** who repeat the same cycle of days and want to see what they lifted last time.
- **Home and calisthenics trainees** who need a simple rest timer and a record of reps.
- **People training without reliable signal** (basement gyms), so the app must work offline.

## User stories

| # | As a user, I want to… | So that… | Status |
|---|---|---|---|
| U1 | sign in with my Google account | my programs follow me to any device | <span class="ff-badge ff-badge--done">Done</span> |
| U2 | create a workout program with a name | I can organise my training | <span class="ff-badge ff-badge--done">Done</span> |
| U3 | add training days and rest days to a program | the program matches my weekly split | <span class="ff-badge ff-badge--done">Done</span> |
| U4 | add exercises with target sets, reps and rest seconds to a day | I know what to do on that day | <span class="ff-badge ff-badge--done">Done</span> |
| U5 | see which day is active and start it from Home | I don't have to remember where I stopped | <span class="ff-badge ff-badge--done">Done</span> |
| U6 | tick off sets, edit the reps I actually did and start a rest timer | I stay focused during the session | <span class="ff-badge ff-badge--done">Done</span> |
| U7 | complete a day and have the next one become active | the program advances automatically | <span class="ff-badge ff-badge--done">Done</span> |
| U8 | see my last five results for an exercise | I know what to beat today | <span class="ff-badge ff-badge--done">Done</span> |
| U9 | start a program over, or jump to a specific day | I can restart a cycle or skip ahead | <span class="ff-badge ff-badge--done">Done</span> |
| U10 | train without internet | a weak signal never blocks a session | <span class="ff-badge ff-badge--done">Done</span> |
| U11 | choose which program is "current" when I have several | Home shows the right one | <span class="ff-badge ff-badge--partial">Partial</span> |
| U12 | see charts of my progress over weeks | I can see that I'm getting stronger | <span class="ff-badge ff-badge--planned">Planned</span> |

## Features

=== "Programs"

    - Create and delete workout programs.
    - Add training days or rest days; days are numbered in order and renumbered after a delete.
    - Add exercises to a day: name, target sets, target reps, rest time in seconds (default 60 s).
    - Edit a program on its own screen (add/delete days and exercises).

=== "Training session"

    - Home shows the current program and a **START WORKOUT** button.
    - The program screen lists days with their state: completed, active, rest or upcoming.
    - The active day screen pre-fills every set with the target reps; each set has a checkbox and editable reps; sets can be added (**Add Set**) or removed.
    - Ticking all sets completes the exercise; a switch completes or reopens all sets at once.
    - The rest timer counts down the exercise's rest time, warns with three short vibrations, and ends with a long one.
    - **Finish Day** saves the sets and reps done for each exercise into its history (last five kept), marks the day complete and activates the next unfinished day.
    - Rest days are marked complete with one tap.

=== "Account and data"

    - Google sign-in through Firebase Auth; sign out from Settings (with confirmation).
    - Data is stored in Cloud Firestore, one document per program, and is visible only to its owner.
    - Firestore offline persistence with unlimited cache: reads come from cache and writes queue while offline.

## Non-functional requirements

| Area | Requirement | How it is met |
|---|---|---|
| Offline | The app is usable without network after the first sign-in | Firestore persistence enabled in `main.dart`; fonts bundled as assets |
| Privacy | A user can never read another user's data | [Firestore rules](../architecture/firebase.md#security-rules) check `userId == auth.uid` |
| Quality | Every change is tested before merge | CI runs format, analyze, tests and an APK build; `master` is protected |
| Visual consistency | Screens don't change by accident | [Golden screenshot tests](../development/testing.md#golden-screenshot-tests) on every PR |
| Small screens | Screens don't overflow on narrow phones | Overflow test at 320 dp for the active day; see [Roadmap](roadmap.md) for the login button |
| Platform | Android first | Android build in CI; the repository has no iOS or web platform folders |

## Out of scope (for now)

- Social features, sharing and leaderboards.
- Nutrition tracking.
- Exercise videos or images (Firebase Storage is not used).
- iOS and web builds.

See the [screens](screens.md) for what each screen looks like and the [roadmap](roadmap.md) for what's next.
