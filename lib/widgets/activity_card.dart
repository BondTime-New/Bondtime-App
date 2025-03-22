import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivityCard extends StatelessWidget {
  final String day;
  final String description;
  final String icon; // path to SVG
  final int index;

  ActivityCard({
    required this.day,
    required this.description,
    required this.icon,
    required this.index,
  });

  final List<Map<String, Color>> cardColors = [
    {"fill": Color(0xFFDCE6FF), "stroke": Color(0xFF5283FF)}, // Blue
    {"fill": Color(0xFFE9FFEB), "stroke": Color(0xFF60D46B)}, // Green
    {"fill": Color(0xFFFFF2CF), "stroke": Color(0xFFF6CE61)}, // Yellow
    {"fill": Color(0xFFFFEAEA), "stroke": Color(0xFFEB9595)}, // Red
  ];

  @override
  Widget build(BuildContext context) {
    final fillColor = cardColors[index]["fill"] ?? Colors.white;
    final strokeColor = cardColors[index]["stroke"] ?? Colors.black;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: strokeColor!, width: 1),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Play Button
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.play_arrow, color: Colors.white),
              ),
              const SizedBox(width: 12),

              // Texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      day,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),

              // Right-side SVG image
              SvgPicture.asset(
                icon,
                width: 64,
                height: 64,
              ),
            ],
          ),

          // "10 minutes" text at the bottom right
          Positioned(
            bottom: 8,
            right: 8,
            child: Text(
              "10 minutes",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
