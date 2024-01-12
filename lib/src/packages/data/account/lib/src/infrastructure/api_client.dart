import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountApiClient {
  final FirebaseAuth _instance;
  final GoogleSignIn _provider;

  AccountApiClient(
    this._instance,
    this._provider,
  );

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _provider.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await _instance.signInWithCredential(credential);
  }

  Future<void> signOut() => Future.wait([
        _instance.signOut(),
        _provider.signOut(),
      ]);

  Stream<User?> getUser() => _instance.authStateChanges();
}
