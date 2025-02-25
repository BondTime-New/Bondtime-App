import 'package:flutter/material.dart';
import 'package:bondtime_app/screens/profile/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BondTime App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'InterTight', // Applying InterTight globally
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'InterTight',
          ),
          bodyLarge: TextStyle(
            fontFamily: 'InterTight',
          ),
          bodySmall: TextStyle(
            fontFamily: 'InterTight',
          ),
          headlineMedium: TextStyle(
            fontFamily: 'InterTight',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}
