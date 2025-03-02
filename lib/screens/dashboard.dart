import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/bottom_navbar.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<String> days = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];
  final List<String> dates = ["19", "20", "21", "1/3", "22", "23", "24"];
  final List<bool> completedDays = [true, true, true, false, false, false, false];
  int selectedIndex = 3; // Default selected day (Thursday)
  int rewardStars = 10; // Number of earned reward stars

  void selectDay(int index) {
    setState(() {
      selectedIndex = index;
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
          SizedBox(width: 0),
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
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              constraints: BoxConstraints(minWidth: 46, minHeight: 28),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Color(0xFFFED7D7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("44",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(width: 4),
                  SvgPicture.asset(
                    'assets/icons/streaks_icon.svg',
                    height: 18,
                    width: 18,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                "Good Evening, Juan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'InterTight',
                ),
              ),
              SizedBox(height: 5),

              // Selectable Dates Section
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(days.length, (index) {
                    return GestureDetector(
                      onTap: () => selectDay(index),
                      child: Column(
                        children: [
                          if (index != selectedIndex)
                            Column(
                              children: [
                                Text(
                                  days[index],
                                  style: TextStyle(
                                    color: index < selectedIndex
                                        ? Color(0xFF111111)
                                        : Color(0xFFC1C1C1),
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 4),
                                if (completedDays[index])
                                  SvgPicture.asset(
                                    "assets/icons/tick.svg",
                                    width: 9,
                                    height: 7.07,
                                  )
                                else
                                  Text(
                                    dates[index],
                                    style: TextStyle(
                                      color: Color(0xFF111111),
                                      fontSize: 14,
                                    ),
                                  ),
                              ],
                            ),
                          if (index == selectedIndex)
                            Container(
                              width: 33,
                              height: 51,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: Color(0xFF111111), width: 0.25),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    days[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF111111),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  if (completedDays[index])
                                    SvgPicture.asset(
                                      "assets/icons/tick.svg",
                                      width: 9,
                                      height: 7.07,
                                    )
                                  else
                                    Text(
                                      "0/3",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF111111),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
              ),

              SizedBox(height: 16),

              // Daily Progress Title
              Text(
                "Daily Progress",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              // Progress Bar + Reward Star (Aligned)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Progress Bar (Unchanged)
                  Expanded(
                    child: Container(
                      height: 9.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey[300],
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 316 * 0.5, // **No changes to width**
                            height: 9.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Space between progress bar and stars

                  // Reward Star Count (⭐ 10)
                  Row(
                    children: [
                      Text(
                        "$rewardStars", // Dynamic star count
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFA500), // Orange star color
                        ),
                      ),
                      SizedBox(width: 4),
                      SvgPicture.asset(
                        "assets/icons/star_icon.svg", // Star icon
                        height: 16,
                        width: 16,
                        color: Color(0xFFFFA500), // Orange star color
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Activity Card (Blue Card)
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Day 4",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(
                        "Spend 10 minutes engaging with your child playing with building blocks"),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.play_circle, size: 40),
                        SvgPicture.asset("assets/icons/notifications.svg",
                            width: 80),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}