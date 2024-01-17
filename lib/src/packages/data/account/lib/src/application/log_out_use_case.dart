import '../domain/auth/auth_service.dart';

class LogOutUseCase {
  final AuthService _authService;

  const LogOutUseCase(
    this._authService,
  );

  Future<void> call() => _authService.logOut();
}
