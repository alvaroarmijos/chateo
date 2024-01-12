import 'package:chateo/src/packages/data/account/account.dart';

class SignUpUseCase {
  final AuthService _authService;

  const SignUpUseCase(
    this._authService,
  );

  Future<void> call() => _authService.logIn();
}
