import '../../Backend/Authentication/Authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationProvider = Provider<Authentication>((ref) {
  return Authentication();
});

final signInProvider = FutureProvider<bool>((ref) async {
  final auth = ref.watch(authenticationProvider);
  return await auth.signInUserAnonymously();
});

final currentUidProvider = StreamProvider<String?>((ref) {
  final auth = ref.watch(authenticationProvider);
  return auth.authStateChanges().map((user) => user?.uid);
});