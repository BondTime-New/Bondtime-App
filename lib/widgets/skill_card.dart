import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final String title;
  final double value;
  final Color color;

  const SkillCard({
    required this.title,
    required this.value,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 182,
      height: 118,
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 13, 8, 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: value / 5,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
              minHeight: 5,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child:
                  Text(value.toString(), style: const TextStyle(fontSize: 12)),
            )
          ],
        ),
      ),
    );
  }
}
