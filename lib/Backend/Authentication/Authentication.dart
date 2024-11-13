import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Config/Constants.dart';

class Authentication {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> signInUserAnonymously() async {

    try {
      await _firebaseAuth.signInAnonymously();
      return true;
    }
    on FirebaseAuthException catch (exception) {
      return false;
    }
  }

  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  Future<void> resetSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Constants.didShowNearFieldOnBoarding, false);
  }

}