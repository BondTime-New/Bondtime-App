import 'package:flutter/material.dart';
import 'screens/profile/profile_screen.dart';

void main() {
  runApp(const BondTimeApp());
}

class BondTimeApp extends StatelessWidget {
  const BondTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BondTime',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F8FF),
      ),
      home: const ProfileScreen(),
    );
  }
}
