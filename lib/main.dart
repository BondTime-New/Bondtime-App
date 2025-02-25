import 'package:flutter/material.dart';
import 'settings_page.dart';

void main() {
  runApp(BondTimeApp());
}

class BondTimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BondTime',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'InterTight',  // Apply Inter Tight globally
      ),
      home: SettingsPage(),
    );
  }
}