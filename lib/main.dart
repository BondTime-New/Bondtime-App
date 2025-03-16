import 'package:flutter/material.dart';
import 'widgets/disease_notification_card.dart';

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
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _handleSeePediatrician() {
    // Handle navigation or action when button is pressed
    print("Navigating to Pediatrician Screen...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Disease Recognition")),
      body: Center(
        child: DiseaseNotificationCard(
          onTap: _handleSeePediatrician,
        ),
      ),
    );
  }
}
