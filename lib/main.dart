import 'package:flutter/material.dart';
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
      theme: ThemeData(primaryColor: Colors.blue),
      darkTheme: ThemeData(primaryColor: Colors.black),
      color: Colors.cyanAccent,
      home: const appbar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
