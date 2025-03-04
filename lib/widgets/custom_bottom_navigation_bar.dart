import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5), // Added top padding for height
      decoration: BoxDecoration(
        color: Color(0xFFFDFDFD), // Background Color
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).toInt()), // 5% opacity
            offset: Offset(0, 4), // X: 0, Y: 4
            blurRadius: 9.3, // Blur
            spreadRadius: 9, // Spread
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor:
            Colors
                .transparent, // Make it transparent to show the container color
        currentIndex: currentIndex,
        onTap: onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed, // Ensure no shifting behavior
        elevation: 0, // Remove shadow if any
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 0
                  ? 'assets/icons/dashboard_selected.svg'
                  : 'assets/icons/dashboard.svg',
              height: 24,
              width: 24,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 1
                  ? 'assets/icons/bondy_selected.svg'
                  : 'assets/icons/bondy.svg',
              height: 24,
              width: 24,
            ),
            label: 'Bondy',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 2
                  ? 'assets/icons/activities_selected.svg'
                  : 'assets/icons/activities.svg',
              height: 24,
              width: 24,
            ),
            label: 'Activities',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 3
                  ? 'assets/icons/pediatricians_selected.svg'
                  : 'assets/icons/pediatricians.svg',
              height: 24,
              width: 24,
            ),
            label: 'Pediatricians',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentIndex == 4
                  ? 'assets/icons/profile_selected.svg'
                  : 'assets/icons/profile.svg',
              height: 24,
              width: 24,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
