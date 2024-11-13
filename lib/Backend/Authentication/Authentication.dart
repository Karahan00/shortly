import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Config/Constants.dart';

/// A service class for handling user authentication with Firebase.
///
/// The `Authentication` class provides methods for signing in users anonymously, tracking authentication state changes,
/// and resetting local shared preferences. It acts as an interface for Firebase Authentication and local storage
/// operations related to authentication.
///
/// Example usage:
/// ```dart
/// final authService = Authentication();
/// bool success = await authService.signInUserAnonymously();
/// ```
class Authentication {

  // FirebaseAuth instance for authentication
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Signs in a user anonymously using Firebase Authentication.
  ///
  /// This method uses the `signInAnonymously` method of the `FirebaseAuth` instance to sign in the user
  /// without requiring any credentials (email or password). It returns a boolean value indicating whether
  /// the sign-in was successful.
  ///
  /// Returns:
  /// - `true` if the sign-in was successful.
  /// - `false` if an error occurred during the sign-in process.
  Future<bool> signInUserAnonymously() async {

    try {
      await _firebaseAuth.signInAnonymously();
      return true;
    }
    on FirebaseAuthException catch (exception) {
      return false;
    }
  }

  /// Provides a stream of authentication state changes.
  ///
  /// This method returns a stream of `User` objects that represent the current authentication state. The stream
  /// emits updates when the authentication state changes, such as when a user logs in or logs out.
  ///
  /// Returns:
  /// - A `Stream<User?>` that emits the current authenticated user, or `null` if the user is not signed in.
  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  /// Resets shared preferences related to user onboarding.
  ///
  /// This method clears specific shared preferences related to the user onboarding flow. It sets the value
  /// for the `didShowNearFieldOnBoarding` key to `false`, which may indicate that the onboarding process
  /// has not yet been shown to the user, or needs to be reset.
  ///
  /// This method may be useful when a user logs out or the app wants to reset certain preferences.
  Future<void> resetSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Constants.didShowNearFieldOnBoarding, false);
  }

}