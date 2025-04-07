import 'package:flutter/material.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(BabyProfileApp());
}

class BabyProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Profile',
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}
