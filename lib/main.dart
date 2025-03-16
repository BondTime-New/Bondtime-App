import 'package:flutter/material.dart';
import 'screens/activity_screen.dart';
import 'widgets/disease_notification_card.dart'; // ✅ Import the widget

void main() {
  runApp(const DiseaseRecognitionApp());
}

class DiseaseRecognitionApp extends StatelessWidget {
  const DiseaseRecognitionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Disease Recognition',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/activity': (context) => const ActivityScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _handleSeePediatrician(BuildContext context) {
    Navigator.pushNamed(context, '/activity'); // ✅ Navigate to Activity Screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Disease Recognition")),
      body: Center(
        child: DiseaseNotificationCard(
          onTap: () => _handleSeePediatrician(context), // ✅ Pass onTap function
        ),
      ),
    );
  }
}
