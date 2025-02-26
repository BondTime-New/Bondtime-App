import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/pediatrician_list_screen.dart';
import 'providers/favorites_provider.dart'; // Make sure the path is correct

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
      home: PediatricianListScreen(),
    );
  }
}
