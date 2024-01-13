import 'package:chateo/src/packages/data/account/account.dart';

class SignUpUseCase {
  final AuthService _authService;
  final EmailValidator _emailValidator;
  final PasswordValidator _passwordValidator;

  const SignUpUseCase(
    this._authService,
    this._emailValidator,
    this._passwordValidator,
  );

  Future<void> call(
    String? email,
    String? password,
    String? confirmPassword,
    String? name,
  ) {
    return Future.sync(() {
      assertPasswordConfirmationIsValid(password, confirmPassword);
      assertEmailIsValid(email);
    }).then((_) => _authService.signUp(
          email!,
          password!,
          name!,
        ));
  }

  void assertEmailIsValid(String? email) {
    if (email == null || !_emailValidator.isValid(email)) {
      throw InvalidEmailException();
    }
  }

  void assertPasswordConfirmationIsValid(
      String? password, String? confirmation) {
    if (password == null ||
        confirmation == null ||
        !_passwordValidator.isConfirmationValid(password, confirmation)) {
      throw InvalidPasswordConfirmationException();
    }
  }
}
