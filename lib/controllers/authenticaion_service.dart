import 'package:firebase_auth/firebase_auth.dart';
import 'package:sketch_color_app/common/user_defaults.dart';

class AuthenticationService {
  // 1
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  // 2
  Stream<User?>? get authStateChanges => _firebaseAuth.authStateChanges();

  // 3
  Future<bool> signIn({required String email, required String password}) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print("*****logged in user ${user.user?.uid.toString()}*****");
      UserDefaults.setCurrentUserId(user.user?.uid.toString() ?? '');
      return true;
    } catch (e) {
      print("failed to login ${e.toString()} ");
      return false;
    }
  }

  // 4
  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Failed to signup..";
    }
  }

  // 5
  Future<String> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return "Signed out";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Failed to logout";
    }
  }

// 6
  User? getUser() {
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException {
      return null;
    }
  }
}
