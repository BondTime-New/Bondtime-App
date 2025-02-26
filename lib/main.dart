import 'package:flutter/material.dart';
import 'screens/rewards_screen.dart';

void main() {
  runApp(RewardsApp());
}

class RewardsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'InterTight',  // Applying Inter Tight globally
      ),
      home: RewardsScreen(),
    );
  }
}