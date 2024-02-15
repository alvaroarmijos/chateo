import 'package:chateo/src/packages/data/account/lib/src/domain/auth/auth_service.dart';

class SignInWithGoogleUseCase {
  final AuthService _authService;

  SignInWithGoogleUseCase(
    this._authService,
  );

  Future<void> call() => _authService.signInWithGoogle();
}
