import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Toggle States
  bool activityReminders = true;
  bool pushNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD), // Set background color
      appBar: AppBar(
        backgroundColor: Color(0xFFFDFDFD),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: Alignment.centerLeft, // Left-align the title
          child: Text(
            'Settings',
            style: TextStyle(
              fontFamily: 'InterTight',
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w500, // Medium font weight
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // General Settings Card
            Container(
              width: 380, // Set width
              height: 328, // Set height
              decoration: BoxDecoration(
                color: Color(0xFFFEFEFE), // Background color #FEFEFE
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Text(
                      'General Settings',
                      style: TextStyle(
                        fontFamily: 'InterTight',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),

                    // Profile Section
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 49,
                          backgroundImage: NetworkImage(
                              'https://via.placeholder.com/150'), // Change with your image URL
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Emily Watson',
                              style: TextStyle(
                                fontFamily: 'InterTight',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Edit Your Profile',
                              style: TextStyle(
                                fontFamily: 'InterTight',
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.edit, color: Colors.black),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Account Settings
                    Text(
                      'Account Settings',
                      style: TextStyle(
                        fontFamily: 'InterTight',
                        fontSize: 18,
                        fontWeight: FontWeight.normal, // Regular font weight
                      ),
                    ),
                    SizedBox(height: 10),

                    // Custom Toggle for Activity Reminders
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Activity Reminders',
                          style: TextStyle(
                            fontFamily: 'InterTight',
                            fontSize: 18,
                            fontWeight: FontWeight.w600, // SemiBold
                          ),
                        ),
                        Switch(
                          value: activityReminders,
                          onChanged: (value) {
                            setState(() {
                              activityReminders = value;
                            });
                          },
                          activeColor: Color(0xFF111111), // Button color when ON
                          activeTrackColor: Color(0xFFC1C1C1), // Track when ON
                          inactiveThumbColor: Color(0xFF888888), // Greyed out when OFF
                          inactiveTrackColor: Color(0xFFC1C1C1), // Track when OFF
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ],
                    ),

                    // Custom Toggle for Push Notifications
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Push Notifications',
                          style: TextStyle(
                            fontFamily: 'InterTight',
                            fontSize: 18,
                            fontWeight: FontWeight.w600, // SemiBold
                          ),
                        ),
                        Switch(
                          value: pushNotifications,
                          onChanged: (value) {
                            setState(() {
                              pushNotifications = value;
                            });
                          },
                          activeColor: Color(0xFF111111), // Button color when ON
                          activeTrackColor: Color(0xFFC1C1C1), // Track when ON
                          inactiveThumbColor: Color(0xFF888888), // Greyed out when OFF
                          inactiveTrackColor: Color(0xFFC1C1C1), // Track when OFF
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),

            // Custom List Tiles
            customListTile(
              icon: Icons.workspace_premium,
              title: 'Manage Subscription',
              onTap: () {},
            ),
            SizedBox(height: 25), // Padding between buttons

            customListTile(
              icon: Icons.security,
              title: 'Security',
              onTap: () {},
            ),
            SizedBox(height: 25), // Padding between buttons

            customListTile(
              icon: Icons.message,
              title: 'Contact us',
              onTap: () {},
            ),
            SizedBox(height: 30),

            // Logout Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Log out',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom ListTile Style
  Widget customListTile({required IconData icon, required String title, required VoidCallback onTap}) {
    return Container(
      width: 380,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFF111111), width: 1), // Stroke color
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'InterTight',
            fontSize: 16, // Text size 16 px
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
        onTap: onTap,
      ),
    );
  }
}