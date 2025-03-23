import 'package:flutter/material.dart';
import 'screens/activity_screen.dart';

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
        fontFamily: 'InterTight',
        useMaterial3: true,
      ),
      home: const ActivityScreen(),
    );
  }
}
