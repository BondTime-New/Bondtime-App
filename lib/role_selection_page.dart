import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoleSelectionPage extends StatefulWidget {
  @override
  _RoleSelectionPageState createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  String? selectedRole;

  void selectRole(String role) {
    setState(() {
      selectedRole = role;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFFFDFDFD), // <-- Background color changed to #fdfdfd
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF111111)),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          shrinkWrap: true, // Prevents unnecessary scrolling space
          physics:
              NeverScrollableScrollPhysics(), // Prevents unwanted scrolling
          children: [
            Text(
              "What’s your special role to this little one",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111111),
                fontFamily: 'InterTight',
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Every detail helps us support your baby’s journey.",
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
                fontFamily: 'InterTight',
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 20),
            RoleCard(
              title: "Mother",
              iconPath: "assets/images/mother.svg",
              isSelected: selectedRole == "Mother",
              onTap: () => selectRole("Mother"),
            ),
            RoleCard(
              title: "Father",
              iconPath: "assets/images/father.svg",
              isSelected: selectedRole == "Father",
              onTap: () => selectRole("Father"),
            ),
            RoleCard(
              title: "Grand Parent",
              iconPath: "assets/images/grand.svg",
              isSelected: selectedRole == "Grand Parent",
              onTap: () => selectRole("Grand Parent"),
            ),
            RoleCard(
              title: "Care Giver",
              iconPath: "assets/images/caregiver.svg",
              isSelected: selectedRole == "Care Giver",
              onTap: () => selectRole("Care Giver"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize:
                    Size(double.infinity, 58), // Fixed height set to 58px
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15), // Button corner radius updated
                ),
              ),
              onPressed: selectedRole != null
                  ? () {
                      // Save role if needed, then go to the next screen
                      Navigator.pushNamed(
                          context, '/home'); // or any route you define
                    }
                  : null,
              child: Text(
                "Next",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'InterTight',
                  fontSize: 18, // Slightly larger text for better readability
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  RoleCard({
    required this.title,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: isSelected ? 1.0 : 0.4, // 100% when selected, 40% when not
        child: Container(
          width: 345,
          height: 110,
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(15), // Corner radius updated to 15
            border: Border.all(
              color: Color(0xFF111111), // Set border color
              width: isSelected ? 2 : 1, // Slightly thicker when selected
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111111), // Text color
                    fontFamily: 'InterTight',
                  ),
                ),
              ),
              Align(
                alignment:
                    Alignment.bottomRight, // Align exactly at the bottom right
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: SvgPicture.asset(
                    iconPath,
                    fit: BoxFit.cover, // Ensures no extra space around the SVG
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
