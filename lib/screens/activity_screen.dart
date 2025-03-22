import 'package:flutter/material.dart';
import '../widgets/activity_card.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('BondTime', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.settings_outlined, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ActivityCard(
              day: 'Day 4',
              description:
                  'Spend 10 minutes engaging with your child playing with building blocks',
              icon: 'assets/illustrations/child_on_shoulder.svg',
              currentPage: 0,
              index: 0,
              totalPages: 4,
            ),
            const SizedBox(height: 16),
            ActivityCard(
              day: 'Daily tips for mama',
              description: 'Drink 12 cups of water (3 litres)',
              icon: 'assets/illustrations/mama.svg',
              currentPage: 1,
              index: 1,
              totalPages: 4,
            ),
            const SizedBox(height: 16),
            ActivityCard(
              day: 'Day 4',
              description:
                  'Spend 10 minutes engaging with your child playing with building blocks',
              icon: 'assets/illustrations/child_on_shoulder.svg',
              currentPage: 2,
              index: 2,
              totalPages: 4,
            ),
            const SizedBox(height: 16),
            ActivityCard(
              day: 'Daily tips for mama',
              description: 'Drink 12 cups of water (3 litres)',
              icon: 'assets/illustrations/mama.svg',
              currentPage: 3,
              index: 3,
              totalPages: 4,
            ),
          ],
        ),
      ),
    );
  }
}
