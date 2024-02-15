class SignUpWithEmailAndPasswordException implements Exception {
  const SignUpWithEmailAndPasswordException([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory SignUpWithEmailAndPasswordException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordException(
          'Email is not valid or badly formatted.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordException(
          'Already exists an account with the given email address.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordException(
          'Password is not strong enough.',
        );
      default:
        return const SignUpWithEmailAndPasswordException();
    }
  }

  /// The associated error message.
  final String message;
}
