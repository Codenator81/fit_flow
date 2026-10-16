import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:fit_flow/core/error/failures.dart';
import 'package:fit_flow/features/auth/domain/entities/auth_user.dart';
import 'package:fit_flow/features/auth/domain/repositories/auth_repository.dart';

/// Signed-in (or signed-out) user without Firebase or Google.
class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository({AuthUser? user}) : _user = user;

  AuthUser? _user;
  final _changes = StreamController<AuthUser?>.broadcast();

  @override
  AuthUser? get currentUser => _user;

  @override
  Stream<AuthUser?> authStateChanges() async* {
    yield _user;
    yield* _changes.stream;
  }

  /// Signs [user] in, like a successful Google sign-in would.
  void signIn(AuthUser user) {
    _user = user;
    _changes.add(user);
  }

  @override
  Future<Either<Failure, Unit>> signInWithGoogle() async {
    signIn(testUser);
    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    _user = null;
    _changes.add(null);
    return const Right(unit);
  }
}

const testUser = AuthUser(uid: 'test-user', email: 'alex.runner@example.com');
