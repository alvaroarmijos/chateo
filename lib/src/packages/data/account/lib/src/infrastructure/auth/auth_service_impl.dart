import 'package:chateo/src/packages/data/account/lib/src/domain/auth/auth_service.dart';
import 'package:chateo/src/packages/data/account/lib/src/domain/user/user.dart';
import 'package:chateo/src/packages/data/account/lib/src/infrastructure/api_client.dart';
import 'package:chateo/src/packages/data/account/lib/src/infrastructure/user/user_mapper.dart';

class AuthServiceImpl implements AuthService {
  final AccountApiClient _apiClient;
  final UserMapper _userMapper;

  AuthServiceImpl(
    this._apiClient,
    this._userMapper,
  );

  @override
  Stream<User?> getUser() => _apiClient.getUser().map(
        (dto) => dto != null ? _userMapper.fromApiDto(dto) : null,
      );

  @override
  Future<void> logIn(
    String email,
    String password,
  ) =>
      _apiClient.loginWithEmailAndPassword(email, password);

  @override
  Future<void> logOut() => _apiClient.signOut();

  @override
  Future<void> signUp(
    String email,
    String password,
    String name,
  ) =>
      _apiClient.signUp(
        email,
        password,
        name,
      );

  @override
  Future<void> signInWithGoogle() => _apiClient.signInWithGoogle();
}
