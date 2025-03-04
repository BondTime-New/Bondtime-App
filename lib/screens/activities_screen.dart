import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/activity_card_no_indicator.dart';
import '../widgets/activity_filter_dropdown.dart';

class ActivitiesScreen extends StatefulWidget {
  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  int selectedTab = 1; // Default: Today
  String selectedFilter = "All"; // Default filter

  final List<Map<String, String>> activities = [
    {
      "day": "Day 4",
      "description": "Read a bedtime story to your child before sleep.",
      "icon": "assets/icons/activity1.svg",
    },
    {
      "day": "Day 4",
      "description": "Spend 10 minutes engaging with your child playing with building blocks.",
      "icon": "assets/icons/activity1.svg",
    },
    {
      "day": "Day 4",
      "description": "Encourage your child to draw something they love.",
      "icon": "assets/icons/activity1.svg",
    },
    {
      "day": "Day 4",
      "description": "Take a short walk outside with your child for fresh air.",
      "icon": "assets/icons/activity1.svg",
    },
  ];

  void _onTabTap(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  void _onFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 30,
        title: SvgPicture.asset(
          'assets/icons/BondTime_logo.svg',
          height: 18,
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/notifications.svg',
              height: 24,
              width: 24,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 8),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/settings.svg',
              height: 24,
              width: 24,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 3),
        ],
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2), // ✅ Highlights "Activities"
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),

                // **Tab Bar & Dropdown (Fixed Spacing)**
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _tabItem("Completed", 0),
                        SizedBox(width: 8), // ✅ Reduced space
                        _tabItem("Today", 1),
                        SizedBox(width: 8), // ✅ Reduced space
                        _tabItem("Upcoming", 2),
                      ],
                    ),
                    ActivityFilterDropdown(onFilterSelected: _onFilterSelected),
                  ],
                ),

                SizedBox(height: 12), // ✅ Reduced spacing

                // **Activity Cards (Only for Today)**
                if (selectedTab == 1)
                  Column(
                    children: activities.map((activity) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ActivityCardNoIndicator(
                          day: activity["day"]!,
                          description: activity["description"]!,
                          icon: activity["icon"]!,
                        ),
                      );
                    }).toList(),
                  ),

                SizedBox(height: 24), // ✅ Bottom spacing
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabItem(String title, int index) {
    return GestureDetector(
      onTap: () => _onTabTap(index),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: index == selectedTab ? FontWeight.bold : FontWeight.normal,
          color: index == selectedTab ? Colors.black : Color(0xFFC1C1C1),
        ),
      ),
    );
  }
}