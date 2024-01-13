import '../user/user.dart';

abstract class AuthService {
  Future<void> logIn();

  Future<void> signUp(
    String email,
    String password,
    String name,
  );

  Future<void> logOut();

  Stream<User?> getUser();
}
