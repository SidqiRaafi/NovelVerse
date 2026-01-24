import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Stream to listen for auth changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // REGISTER with Email & Password
  Future<User?> registerWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth errors
      switch (e.code) {
        case 'weak-password':
          throw 'Password is too weak';
        case 'email-already-in-use':
          throw 'Email already registered';
        case 'invalid-email':
          throw 'Invalid email format';
        default:
          throw 'Registration failed: ${e.message}';
      }
    } catch (e) {
      throw 'Registration failed: $e';
    }
  }

  // LOGIN with Email & Password
  Future<User?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth errors
      switch (e.code) {
        case 'user-not-found':
          throw 'No user found with this email';
        case 'wrong-password':
          throw 'Wrong password';
        case 'invalid-email':
          throw 'Invalid email format';
        case 'user-disabled':
          throw 'This account has been disabled';
        case 'invalid-credential':
          throw 'Invalid email or password';
        default:
          throw 'Login failed: ${e.message}';
      }
    } catch (e) {
      throw 'Login failed: $e';
    }
  }

  // LOGOUT
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw 'Logout failed: $e';
    }
  }

  // Check if user is logged in
  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  // Get user email
  String? getUserEmail() {
    return _auth.currentUser?.email;
  }

  // Get user ID
  String? getUserId() {
    return _auth.currentUser?.uid;
  }
}
