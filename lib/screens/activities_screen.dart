import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/activity_card_no_indicator.dart';
import '../widgets/activity_filter_dropdown.dart'; // ✅ Import dropdown filter

class ActivitiesScreen extends StatefulWidget {
  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  String selectedFilter = "All"; // ✅ Default filter selected

  final List<Map<String, String>> activities = [
    {
      "day": "Day 4",
      "description": "Read a bedtime story to your child before sleep.",
      "icon": "assets/icons/activity1.svg",
      "category": "Gross Motor", // ✅ Assigning categories for filtering
    },
    {
      "day": "Day 4",
      "description": "Spend 10 minutes engaging with your child playing with building blocks.",
      "icon": "assets/icons/activity1.svg",
      "category": "Fine Motor",
    },
    {
      "day": "Day 4",
      "description": "Encourage your child to draw something they love.",
      "icon": "assets/icons/activity1.svg",
      "category": "Communication",
    },
    {
      "day": "Day 4",
      "description": "Take a short walk outside with your child for fresh air.",
      "icon": "assets/icons/activity1.svg",
      "category": "Sensory",
    },
  ];

  // ✅ Function to update filter selection
  void updateFilter(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  // ✅ Filter activities based on selected category
  List<Map<String, String>> getFilteredActivities() {
    if (selectedFilter == "All") {
      return activities;
    }
    return activities.where((activity) => activity["category"] == selectedFilter).toList();
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'InterTight',
                    ),
                  ),
                  
                  // **Activity Filter Dropdown**
                  ActivityFilterDropdown(onFilterSelected: updateFilter), // ✅ Dropdown filter
                ],
              ),
              SizedBox(height: 16),

              // **Activity Cards (Filtered)**
              Column(
                children: getFilteredActivities().map((activity) {
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

              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}