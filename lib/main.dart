import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/ai_welcome_screen.dart';

void main() {
  runApp(BondTimeApp());
}

class BondTimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BondTime AI Companion',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: Color(0xFF5A87FE),
        scaffoldBackgroundColor: Color(0xFFF8F9FA),
      ),
      home: AIWelcomeScreen(),
    );
  }
}
