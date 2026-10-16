import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/auth_user.dart';

abstract class AuthRepository {
  /// Emits the current user (or null) on subscription and on every change.
  Stream<AuthUser?> authStateChanges();

  AuthUser? get currentUser;

  /// Runs the Google sign-in flow. A cancelled flow is not a failure.
  Future<Either<Failure, Unit>> signInWithGoogle();

  Future<Either<Failure, Unit>> signOut();
}
