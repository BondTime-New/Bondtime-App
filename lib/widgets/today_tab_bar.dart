import 'package:flutter/material.dart';

class TodayTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  TodayTabBar({
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Aligns left
      children: [
        _buildTab("Completed", 0),
        SizedBox(width: 16), // Space between tabs
        _buildTab("Today", 1, isBold: true), // Today is bold
        SizedBox(width: 16),
        _buildTab("Upcoming", 2),
      ],
    );
  }

  Widget _buildTab(String title, int index, {bool isBold = false}) {
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          color: selectedIndex == index ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}