import 'package:chateo/src/packages/data/account/account.dart';

class CheckUserLoginUseCase {
  final AuthService _authService;

  CheckUserLoginUseCase(
    this._authService,
  );

  Stream<bool> call() => _authService.getUser().map((user) => user != null);
}
