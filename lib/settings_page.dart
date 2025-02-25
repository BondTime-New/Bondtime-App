import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD), // Set background color here
      appBar: AppBar(
        backgroundColor: Color(0xFFFDFDFD), // Set AppBar background color
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // General Settings Card
          
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
            fontFamily: 'InterTight', // Use Inter Tight
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),

        // Profile Section
        Row(
          children: [
            CircleAvatar(
              radius: 35,
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
                    fontFamily: 'InterTight', // Use Inter Tight
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Edit Your Profile',
                  style: TextStyle(
                    fontFamily: 'InterTight', // Use Inter Tight
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
            fontFamily: 'InterTight', // Use Inter Tight
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SwitchListTile(
          title: Text(
            'Activity Reminders',
            style: TextStyle(
              fontFamily: 'InterTight', // Use Inter Tight
              fontWeight: FontWeight.bold,
            ),
          ),
          value: true,
          onChanged: (value) {},
        ),
        SwitchListTile(
          title: Text(
            'Push Notifications',
            style: TextStyle(
              fontFamily: 'InterTight', // Use Inter Tight
              fontWeight: FontWeight.bold,
            ),
          ),
          value: false,
          onChanged: (value) {},
        ),
      ],
    ),
  ),
),
            SizedBox(height: 20),

            // Account Settings
            Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            SizedBox(height: 20),

            // Subscription, Security, Contact us
            ListTile(
              leading: Icon(Icons.workspace_premium, color: Colors.black),
              title: Text('Manage Subscription'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.security, color: Colors.black),
              title: Text('Security'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.message, color: Colors.black),
              title: Text('Contact us'),
              trailing: Icon(Icons.arrow_forward_ios),
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
}