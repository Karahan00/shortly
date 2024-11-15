import 'package:flutter/material.dart';
import 'package:shortly/Controller/Home/HomeController.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(
      child: ShortlyApp(),
    )
  );
}

class ShortlyApp extends StatelessWidget {

  const ShortlyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shortly - The basic URL shorter',
      debugShowCheckedModeBanner: false,
      home: HomeController(),
    );
  }
}
