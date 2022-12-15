/// {@template log_in_with_email_and_password_failure}
/// Thrown during the login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
/// {@endtemplate}
class CreateUserWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const CreateUserWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory CreateUserWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const CreateUserWithEmailAndPasswordFailure(
          'There already exists an account with the given email address.',
        );
      case 'invalid-email':
        return const CreateUserWithEmailAndPasswordFailure(
          'The email address is not valid.',
        );
      case 'operation-not-allowed':
        return const CreateUserWithEmailAndPasswordFailure(
          'Operation not allowed, please contact support.',
        );
      case 'weak-password':
        return const CreateUserWithEmailAndPasswordFailure(
          'Password is too weak, please try again with a mix '
          'of letters and numbers.',
        );
      default:
        return const CreateUserWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}
