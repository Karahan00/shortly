import 'package:flutter/material.dart';
import 'package:shortly/Controller/Home/HomeController.dart';

import 'Config/Constants.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

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
