import 'package:flutter/material.dart';

// Import all the screens used in your app
import 'onboarding_screen.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';
import 'baby_registration_screen.dart';
import 'otp_screen.dart';

// The main function is the starting point of the app
void main() {
  runApp(const MyApp()); // Runs the app
}

// This is the root widget of your app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner

      // App-wide theme settings
      theme: ThemeData(
        fontFamily: 'InterTight', // Uses custom font throughout the app
      ),

      // The first screen that shows when the app starts
      initialRoute: '/',

      // Define named routes for easy navigation between screens
      routes: {
        '/': (context) => const OnboardingScreen(), // Welcome screen
        '/sign-in': (context) => const SignInScreen(), // Login screen
        '/sign-up': (context) => const SignUpScreen(), // Sign up screen
        '/baby-registration': (context) =>
            const BabyRegistrationScreen(), // Baby info screen
        '/otp-verification': (context) => const OtpScreen(), // OTP screen
      },
    );
  }
}
