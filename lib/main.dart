import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';
import 'baby_registration_screen.dart';
import 'otp_screen.dart'; // ✅ Import the OTP screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'InterTight',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/sign-in': (context) => const SignInScreen(),
        '/sign-up': (context) => const SignUpScreen(),
        '/baby-registration': (context) => const BabyRegistrationScreen(),
        '/otp-verification': (context) => const OtpScreen(), // ✅ Add OTP screen
      },
    );
  }
}
