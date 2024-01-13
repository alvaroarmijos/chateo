import 'package:chateo/src/packages/data/account/lib/src/domain/auth/email_validator.dart';
import 'package:chateo/src/packages/data/account/lib/src/domain/exceptions.dart';

import '../domain/auth/auth_service.dart';

class LogInWithEmailAndPasswordUseCase {
  final AuthService _authService;
  final EmailValidator _emailValidator;

  const LogInWithEmailAndPasswordUseCase(
    this._authService,
    this._emailValidator,
  );

  Future<void> call(
    String email,
    String password,
  ) =>
      Future.sync(() => assertEmailIsValid(email)).then(
        (_) => _authService.logInWithEmailAndPassword(
          email,
          password,
        ),
      );

  void assertEmailIsValid(String email) {
    if (!_emailValidator.isValid(email)) {
      throw InvalidEmailException();
    }
  }
}
