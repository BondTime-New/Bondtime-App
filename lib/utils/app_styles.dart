import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle headingText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const EdgeInsets screenPadding =
      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);

  static BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ],
  );
}
