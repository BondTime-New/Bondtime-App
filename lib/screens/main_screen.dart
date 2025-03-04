import 'package:flutter/material.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import 'dashboard_screen.dart';
import 'bondy_screen.dart';
import 'activities_screen.dart';
import 'pediatrician_list_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // 🔹 List of screens for each tab
  final List<Widget> _screens = [
    DashboardScreen(),
    BondyScreen(),
    ActivitiesScreen(),
    PediatricianListScreen(),
    ProfileScreen(),
  ];

  // 🔹 Function to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Show selected screen
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Pass function to handle navigation
      ),
    );
  }
}
