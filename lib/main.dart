import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:bondtime_app/screens/profile/profile_screen.dart';
=======
import 'settings_page.dart';
>>>>>>> Sasvin

void main() {
  runApp(BondTimeApp());
}

<<<<<<< HEAD
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

=======
class BondTimeApp extends StatelessWidget {
>>>>>>> Sasvin
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      title: 'BondTime App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'InterTight', // Applying InterTight globally
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'InterTight',
          ),
          bodyLarge: TextStyle(
            fontFamily: 'InterTight',
          ),
          bodySmall: TextStyle(
            fontFamily: 'InterTight',
          ),
          headlineMedium: TextStyle(
            fontFamily: 'InterTight',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}
=======
      title: 'BondTime',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'InterTight',  // Apply Inter Tight globally
      ),
      home: SettingsPage(),
    );
  }
}
>>>>>>> Sasvin
