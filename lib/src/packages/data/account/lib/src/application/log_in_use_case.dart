import 'package:chateo/src/packages/data/account/account.dart';

class LogInUseCase {
  final AuthService _authService;
  final EmailValidator _emailValidator;

  LogInUseCase(
    this._authService,
    this._emailValidator,
  );

  Future<void> call(
    String? email,
    String? password,
  ) {
    return Future.sync(() {
      assertEmailIsValid(email);
    }).then((_) => _authService.logIn(
          email!,
          password!,
        ));
  }

  void assertEmailIsValid(String? email) {
    if (email == null || !_emailValidator.isValid(email)) {
      throw InvalidEmailException();
    }
  }
}
