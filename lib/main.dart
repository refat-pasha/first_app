import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:first_app/screens/appbar.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Flutter App',
      //theme: ThemeData.dark(),
      home: const appbar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
