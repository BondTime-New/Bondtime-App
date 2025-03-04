import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen.dart'; // ✅ Update this import
import 'providers/favorites_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FavoritesProvider())],
      child: BondTimeApp(),
    ),
  );
}

class BondTimeApp extends StatelessWidget {
  const BondTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BondTime',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(), // ✅ Use MainScreen instead
    );
  }
}
