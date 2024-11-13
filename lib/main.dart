import 'package:flutter/material.dart';
import 'package:shortly/Controller/Home/HomeController.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Config/Constants.dart';

void main() {
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
