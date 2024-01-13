import '../../domain/auth/auth_service.dart';
import '../../domain/user/user.dart';
import '../api_client.dart';
import '../user/user_mapper.dart';

class AuthServiceImpl implements AuthService {
  final AccountApiClient _apiClient;
  final UserMapper _userMapper;

  const AuthServiceImpl(
    this._apiClient,
    this._userMapper,
  );

  @override
  Future<void> logInWithGoogle() => _apiClient.signInWithGoogle();

  @override
  Future<void> logOut() => _apiClient.signOut();

  @override
  Stream<User?> getUser() => _apiClient
      .getUser()
      .map((user) => user == null ? null : _userMapper.fromApiDto(user));

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
  Future<void> logInWithEmailAndPassword(
    String email,
    String password,
  ) =>
      _apiClient.logInWithEmailAndPassword(
        email,
        password,
      );
}
