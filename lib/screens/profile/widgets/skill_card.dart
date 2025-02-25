import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final String skillName;
  final double score;
  final Color backgroundColor;

  const SkillCard({
    Key? key,
    required this.skillName,
    required this.score,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160, // Adjust Width Here
      height: 130, // Adjust Height Here
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Left-aligns text
        mainAxisAlignment: MainAxisAlignment.center, // Centers vertically
        children: [
          // Skill Name (2 lines)
          Text(
            skillName,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
              height: 1.2, // Adjust line height for better spacing
            ),
            maxLines: 2, // Ensures text wraps into 2 lines
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          // Progress Bar
          LinearProgressIndicator(
            value: score / 5,
            backgroundColor: Colors.grey[300],
            color: Colors.black,
            minHeight: 5,
          ),
          const SizedBox(height: 4),
          // Score
          Text(
            score.toString(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
