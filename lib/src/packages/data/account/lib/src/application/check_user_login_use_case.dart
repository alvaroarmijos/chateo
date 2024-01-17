import '../domain/auth/auth_service.dart';

class CheckUserLoginUseCase {
  final AuthService _authService;

  const CheckUserLoginUseCase(this._authService);

  Stream<bool> call() => _authService.getUser().map((user) => user != null);
}
