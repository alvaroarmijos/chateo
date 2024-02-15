import 'package:chateo/src/packages/data/account/account.dart';

class GetUserUseCase {
  final AuthService _authService;

  GetUserUseCase(
    this._authService,
  );

  Stream<User?> call() => _authService.getUser();
}
