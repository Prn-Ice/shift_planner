import 'package:authentication_repository/authentication_repository.dart';
import 'package:authentication_repository/src/local_data_source/authentication_local_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class AuthenticationRepository {
  /// {@macro authentication_repository}
  AuthenticationRepository({
    required Box<dynamic> box,
    firebase_auth.FirebaseAuth? firebaseAuth,
  })  : _localDataSource = AuthenticationLocalDataSource(box: box),
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final AuthenticationLocalDataSource _localDataSource;
  final firebase_auth.FirebaseAuth _firebaseAuth;

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  User get currentUser {
    return _localDataSource.get(AuthenticationLocalDataSource.key) ??
        User.empty;
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  TaskEither<String, User> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return TaskEither.tryCatch(
      () async {
        final response = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        final user = response.user!.toUser;
        await _localDataSource.put(AuthenticationLocalDataSource.key, user);

        return user;
      },
      (e, s) {
        if (e is firebase_auth.FirebaseAuthException) {
          return LogInWithEmailAndPasswordFailure.fromCode(e.code).message;
        }

        return const LogInWithEmailAndPasswordFailure().message;
      },
    );
  }

  /// Register a user with the provided [email] and [password].
  ///
  /// Throws a [CreateUserWithEmailAndPasswordFailure] if an exception occurs.
  TaskEither<String, User> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return TaskEither.tryCatch(
      () async {
        final response = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        final user = response.user!.toUser;
        await _localDataSource.put(AuthenticationLocalDataSource.key, user);

        return user;
      },
      (e, s) {
        if (e is firebase_auth.FirebaseAuthException) {
          return CreateUserWithEmailAndPasswordFailure.fromCode(e.code).message;
        }

        return const CreateUserWithEmailAndPasswordFailure().message;
      },
    );
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the `user` Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  TaskEither<String, bool> logOut() {
    return TaskEither.tryCatch(
      () async {
        await _firebaseAuth.signOut();
        await _localDataSource.clear();

        return true;
      },
      (e, s) => 'Unable to log out',
    );
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email);
  }
}
