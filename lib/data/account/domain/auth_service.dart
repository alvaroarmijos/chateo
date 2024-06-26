import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  // Login with Google
  Future<void> loginWithGoogle();

  // Get current user
  Stream<User?> get currentUser;
}
