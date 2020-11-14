import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/models/user.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LocalUser _userFromFirebase(User user) {
    return user != null ? LocalUser(userId: user.uid) : false;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = userCredential.user;

      return _userFromFirebase(firebaseUser);
    } catch (e) {
      print(e);
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser = userCredential.user;
      return _userFromFirebase(firebaseUser);
    } catch (e) {
      print(e);
    }
  }

  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future signInWithGoogle() {
    try {
      return null;
    } catch (e) {
      print(e);
    }
  }
}
