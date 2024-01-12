import '../domain/auth/auth_service.dart';

class LogInUseCase {
  final AuthService _authService;

  const LogInUseCase(
    this._authService,
  );

  Future<void> call() => _authService.logIn();
}
