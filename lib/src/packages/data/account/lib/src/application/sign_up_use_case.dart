import 'package:chateo/src/packages/data/account/account.dart';

class SignUpUseCase {
  final AuthService _authService;
  final EmailValidator _emailValidator;
  final PasswordValidator _passwordValidator;

  SignUpUseCase(
    this._authService,
    this._emailValidator,
    this._passwordValidator,
  );

  Future<void> call(
    String? email,
    String? password,
    String? confirmationPassword,
    String? name,
  ) {
    return Future.sync(() {
      assertEmailIsValid(email);
      assertPassworConfirmationIsValid(password, confirmationPassword);
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

  void assertPassworConfirmationIsValid(
      String? password, String? confirmation) {
    if (password == null ||
        confirmation == null ||
        !_passwordValidator.isConfirmationValid(password, confirmation)) {
      throw InvalidPasswordConfirmationException();
    }
  }
}
