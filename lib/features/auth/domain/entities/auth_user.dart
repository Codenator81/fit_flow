/// The signed-in user as the app sees it, independent of Firebase.
class AuthUser {
  final String uid;
  final String? email;

  const AuthUser({required this.uid, this.email});
}
