# Firebase

| | |
|---|---|
| Project | `fitflow-54711` (`.firebaserc`) |
| Services | Firebase Auth (Google provider), Cloud Firestore |
| Firestore location | `nam5` (`firebase.json`) |
| Android config | `android/app/google-services.json` (committed) |
| Plan | Spark (free); Firebase Storage is not used |

## Initialization

`main.dart` calls `Firebase.initializeApp()` (configured from `google-services.json` on Android) and enables offline persistence before anything else:

```dart
FirebaseFirestore.instance.settings = const Settings(
  persistenceEnabled: true,
  cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
);
```

With persistence on, reads are served from the local cache when offline and writes are queued and synced later.

!!! note
    Because `main()` initializes Firebase, the real app cannot start without Firebase configuration. Tests don't call `main()`; they register fakes instead (see [Testing](../development/testing.md)).

## Data

A single top-level collection, `workouts`. Every document has a `userId` field with the owner's uid, and the app always queries:

```dart
firestore
    .collection('workouts')
    .where('userId', isEqualTo: uid)
    .orderBy('createdAt', descending: true)
```

This query needs the composite index **userId ↑ + createdAt ↓**, declared in `firestore.indexes.json`.

## Security rules

`firestore.rules` allows a signed-in user to read, create, update and delete only documents whose `userId` equals their uid, and forbids changing the owner on update. Everything else is denied.

Rules and indexes in the repository take effect only after a deploy:

```bash
firebase deploy --only firestore:rules,firestore:indexes
```

Deploys are done by the project owner with the Firebase CLI logged in to their account.

## Google sign-in on Android

Google sign-in works only for app builds signed with a key whose **SHA-1 and SHA-256** fingerprints are registered in the Firebase Android app (Project settings → Your apps → Android). For a new development machine:

1. Print the debug key fingerprints:
    ```bash
    keytool -list -v -keystore ~/.android/debug.keystore \
      -alias androiddebugkey -storepass android -keypass android
    ```
    (or `./gradlew signingReport` in `android/` after the first Flutter build has generated the Gradle wrapper).
2. Add both fingerprints to the Android app in the Firebase console.
3. Run the app again and sign in.

`google-services.json` does not need to be downloaded again after adding fingerprints.
