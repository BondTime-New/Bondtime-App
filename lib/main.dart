import 'package:flutter/material.dart';
import 'package:bondtime_activity/screens/activity_screen.dart';

void main() {
  runApp(BondTimeApp());
}

class BondTimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'InterTight',
      ),
      home: ActivityScreen(),
    );
  }
}