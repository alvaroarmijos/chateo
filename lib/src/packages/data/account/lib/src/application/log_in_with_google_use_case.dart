import '../domain/auth/auth_service.dart';

class LogInWithGoogleUseCase {
  final AuthService _authService;

  const LogInWithGoogleUseCase(
    this._authService,
  );

  Future<void> call() => _authService.logInWithGoogle();
}
