import 'package:flutter/material.dart';
import 'sign_up_screen.dart'; // ✅ Correct Import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'InterTight',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SignUpScreen(), // Ensure SignUpScreen exists
    );
  }
}
