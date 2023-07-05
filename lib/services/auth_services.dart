import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:joso_app/login.dart';

class AuthServices {
  static final _firebaseAuth = FirebaseAuth.instance;

  static Future<String> register(
      {required String email, required String password}) async {
    String res = "something went wrong";
    try {
      UserCredential _cred = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .set({'username': "", 'email': "", 'about me': "", 'experience': ""});

    return res;
  }

  static signout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> Login(
      {required String email, required String password}) async {
    String res = "something went wrong";
    try {
      UserCredential _cred = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = await FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      res = "success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  currentuser() {}
}
