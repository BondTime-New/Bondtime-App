import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bondtime_activity/screens/activity_screen_two.dart';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 30, // Reduced padding between back arrow and logo
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: SvgPicture.asset(
          'assets/icons/bondtime_logo.svg', // Path to your SVG logo
          height: 18, // Set height to 22px
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
  Padding(
    padding: const EdgeInsets.only(right: 10.0), // Adjust this value to push more
    child: IconButton(
      icon: SvgPicture.asset(
        'assets/icons/settings.svg',
        height: 24,
        width: 24,
        color: Colors.black,
      ),
      onPressed: () {},
    ),
  ),
],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            SvgPicture.asset(
              'assets/icons/engagement.svg',
              height: 261,
              width: 196,
            ),
            SizedBox(height: 35),
            Text(
              'Spend 10 minutes engaging with your child',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Container(
              width: 344,
              height: 58,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ActivityScreenTwo()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Start',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'bondy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.extension),
            label: 'activities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services_outlined),
            label: 'pediatricians',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}