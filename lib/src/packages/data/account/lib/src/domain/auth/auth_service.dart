import '../user/user.dart';

abstract class AuthService {
  Future<void> logIn(
    String email,
    String password,
  );

  Future<void> signInWithGoogle();

  Future<void> signUp(
    String email,
    String password,
    String name,
  );

  Future<void> logOut();

  Stream<User?> getUser();
}
