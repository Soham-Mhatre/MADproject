import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email/password
  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw _AuthExceptionHandler.handleException(e);
    }
  }

  // Sign up with email/password
  Future<User?> signUp(String email, String password) async {
    try {
      final UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw _AuthExceptionHandler.handleException(e);
    }
  }

  // Sign out
  Future<void> signOut() async => await _auth.signOut();

  // Auth state stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}

class _AuthExceptionHandler {
  static String handleException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'Invalid email format';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'user-not-found':
        return 'No account found for this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'email-already-in-use':
        return 'Email already registered';
      case 'weak-password':
        return 'Password must be at least 6 characters';
      default:
        return 'Authentication error: ${e.message}';
    }
  }
}