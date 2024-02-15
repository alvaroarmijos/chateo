import 'package:chateo/src/packages/data/account/account.dart';

class LogOutUseCase {
  final AuthService _authService;

  LogOutUseCase(
    this._authService,
  );

  Future<void> call() => _authService.logOut();
}
