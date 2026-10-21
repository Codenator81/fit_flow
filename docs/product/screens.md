# Screens

Every image on this page is a golden screenshot from `test/goldens/screens/`. The test suite renders the real app at phone size (390 × 844 logical pixels) with sample data and fails if a screen changes unexpectedly, so these pictures always match the code on `master`.

<div class="grid" markdown>

<figure markdown>
![Login](../assets/screens/login_page.png){ width="300" }
</figure>

<div markdown>
### Login

The first screen for a signed-out user. A single **Continue with Google** button runs Google sign-in through Firebase Auth. `AuthGate` listens to the auth state and switches to Home as soon as the user is signed in.
</div>

<figure markdown>
![Home without workouts](../assets/screens/home_empty.png){ width="300" }
</figure>

<div markdown>
### Home, first run

A new user has no programs yet. Home invites them to create the first one with **Add New Workout**, which opens a bottom sheet asking for the program name.
</div>

<figure markdown>
![Home](../assets/screens/home.png){ width="300" }
</figure>

<div markdown>
### Home

Shows the current program (the most recently created one) and the big **START WORKOUT** button. The menu in the top bar opens Settings.
</div>

<figure markdown>
![Workout detail](../assets/screens/workout_detail.png){ width="300" }
</figure>

<div markdown>
### Program (workout detail)

All days of the program with their state: completed, active, rest day or upcoming. Tap a training day to start it, tap a rest day to mark it complete, or press **Start Workout Over** to reset the cycle. A completed day shows the date it was finished.
</div>

<figure markdown>
![Active day](../assets/screens/active_day.png){ width="300" }
</figure>

<div markdown>
### Active day

The training session. Each exercise shows its target (for example 3 sets × 5 reps), a rest timer button and a completion switch. Every set has a checkbox and editable reps, and sets can be added or removed. Long-press an exercise to see its last five results. **Finish Day** saves the results and moves to the next day.
</div>

<figure markdown>
![Settings](../assets/screens/settings.png){ width="300" }
</figure>

<div markdown>
### Settings

Profile initials, a current-program selector, buttons to edit or delete a program, **Add New Workout**, and **Logout** with a confirmation dialog.
</div>

</div>

!!! tip "Updating these screenshots"
    Change the UI, run `flutter test --update-goldens test/goldens`, and commit the new PNGs. The pull request shows a before/after comment, and this site picks up the new images on the next deploy. See [Testing](../development/testing.md).
