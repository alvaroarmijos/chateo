import 'package:chateo/src/packages/data/account/lib/src/domain/auth/login_with_email_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountApiClient {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AccountApiClient(
    this._firebaseAuth,
    this._googleSignIn,
  );

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication? googeAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googeAuth?.accessToken,
      idToken: googeAuth?.idToken,
    );

    return await _firebaseAuth.signInWithCredential(credential);
  }

  Future<UserCredential> signUp(
    String email,
    String password,
    String name,
  ) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await userCredential.user?.updateDisplayName(name);

    return userCredential;
  }

  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordException.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordException();
    }
  }

  Future<void> signOut() => Future.sync(() {
        _firebaseAuth.signOut();
        _googleSignIn.signOut();
      });

  Stream<User?> getUser() => _firebaseAuth.authStateChanges();
}
