import 'package:flutter/material.dart';
import 'screens/feedback_screen.dart';

void main() {
  runApp(const BondTimeApp());
}

class BondTimeApp extends StatelessWidget {
  const BondTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BondTime',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FeedbackScreen(),
    );
  }
}
