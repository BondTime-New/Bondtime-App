import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Import SplashScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BondTime',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', // change fonts from here
      ),
      home: const SplashScreen(), // start with SplashScreen
    );
  }
}
