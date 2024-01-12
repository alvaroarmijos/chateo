import '../user/user.dart';

abstract class AuthService {
  Future<void> logIn();

  Future<void> signUp();

  Future<void> logOut();

  Stream<User?> getUser();
}
