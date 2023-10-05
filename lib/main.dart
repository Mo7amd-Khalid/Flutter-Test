import 'package:flutter/material.dart';
import 'package:quiz_app/modules/start/start_screen.dart';
import 'package:quiz_app/shared/style/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
