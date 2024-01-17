import '../../../account.dart';

class GetUserUseCase {
  final AuthService _authService;

  const GetUserUseCase(this._authService);

  Stream<User?> call() => _authService.getUser();
}
