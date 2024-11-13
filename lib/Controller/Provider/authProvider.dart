import '../../Backend/Authentication/Authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for managing authentication-related logic
final authenticationProvider = Provider<Authentication>((ref) {
  return Authentication();
});

// Future provider for signing in a user anonymously
final signInProvider = FutureProvider<bool>((ref) async {
  final auth = ref.watch(authenticationProvider);
  return await auth.signInUserAnonymously();
});

// Stream provider for tracking the current user's UID (User ID)
final currentUidProvider = StreamProvider<String?>((ref) {
  final auth = ref.watch(authenticationProvider);
  return auth.authStateChanges().map((user) => user?.uid);
});