import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivityCardNoIndicator extends StatelessWidget {
  final String day;
  final String description;
  final String icon;

  ActivityCardNoIndicator({
    required this.day,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 175,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFDCE6FF), // ✅ Default blue fill
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFF5283FF), width: 1), // ✅ Default blue stroke
      ),
      child: Stack(
        children: [
          // **Day Title**
          Positioned(
            top: 0,
            left: 0,
            child: Text(
              day,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          // **Description**
          Positioned(
            top: 30,
            left: 0,
            child: SizedBox(
              width: 250,
              child: Text(
                description,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),

          // **Play Button**
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset(
              "assets/icons/playicon.svg",
              width: 50,
              height: 50,
            ),
          ),

          // **Activity Image**
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              icon,
              width: 98,
              height: 131,
            ),
          ),
        ],
      ),
    );
  }
}