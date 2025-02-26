import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RewardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          "Rewards",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          // Streaks Icon with Number - Responsive Width
          Container(
            constraints: BoxConstraints(
              minWidth: 46,   // Minimum width
              minHeight: 28,  // Fixed height
            ),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xFFFED7D7),  // Light red background
              borderRadius: BorderRadius.circular(20), // Full radius for circular shape
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,  // Make width responsive to content
              children: [
                Text(
                  "44", // Change this to test with different numbers (e.g., "30", "300")
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
          SizedBox(width: 16), // Space between icons

          // Rewards Icon
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/reward_icon.svg',
              height: 24,
              width: 24,
              color: Colors.orange,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(   // Added Scrollable Wrapper
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Earned Reward Card
              Container(
                width: 378,  // Set width to 378 px
                height: 181, // Set height to 181 px
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/reward_icon.svg',
                      height: 50,
                      width: 50,
                      color: Colors.orange,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Steady Starter",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Recognizing the early consistency in bonding.\n(10 days streak)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Whats next",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16),
              
              // List of Upcoming Rewards
              ListView.builder(
                physics: NeverScrollableScrollPhysics(), // Disable inner scrolling
                shrinkWrap: true, // Make ListView take minimum height
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        // Custom SVG Icon for Award Card
                        SvgPicture.asset(
                          'assets/icons/reward_icon.svg',
                          height: 30,
                          width: 30,
                          color: Colors.black,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Steady Starter",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Recognizing the early consistency in bonding.\n(10 days streak)",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "13/20",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            // Progress Bar
                            Container(
                              width: 50,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[300], // Background color of the progress bar
                                borderRadius: BorderRadius.circular(20), // Full radius for rounded edges
                              ),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: 0.6,  // 60% progress
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,  // Progress color
                                    borderRadius: BorderRadius.circular(20), // Full radius for rounded edges
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "bondy",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.extension),
            label: "activities",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: "pediatricians",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile",
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}