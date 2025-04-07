import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String label;
  final String value;

  const StatCard({required this.label, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 6),
          Text(value,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
