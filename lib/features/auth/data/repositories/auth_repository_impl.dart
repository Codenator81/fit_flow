import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  AuthRepositoryImpl({required this.auth, required this.googleSignIn});

  // google_sign_in 7 must be initialized exactly once before authenticate().
  Future<void>? _googleInit;

  @override
  Stream<AuthUser?> authStateChanges() => auth.authStateChanges().map(_toUser);

  @override
  AuthUser? get currentUser => _toUser(auth.currentUser);

  @override
  Future<Either<Failure, Unit>> signInWithGoogle() async {
    try {
      await (_googleInit ??= googleSignIn.initialize());
      final googleUser = await googleSignIn.authenticate();
      final credential = GoogleAuthProvider.credential(
        idToken: googleUser.authentication.idToken,
      );
      // AuthGate reacts to the auth state change and shows the home screen.
      await auth.signInWithCredential(credential);
      return const Right(unit);
    } on GoogleSignInException catch (e) {
      // The user closed the Google account picker.
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return const Right(unit);
      }
      return const Left(
        AuthFailure('Google sign-in failed. Please try again.'),
      );
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Authentication failed'));
    } catch (_) {
      return const Left(AuthFailure('An error occurred. Please try again.'));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await auth.signOut();
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(e.message ?? 'Sign out failed'));
    }
  }

  static AuthUser? _toUser(User? user) =>
      user == null ? null : AuthUser(uid: user.uid, email: user.email);
}
