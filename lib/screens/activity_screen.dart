import 'package:flutter/material.dart';
import '../widgets/activity_card.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'BondTime',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // Sorting Button
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onSelected: (value) {
              // Handle selection
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'All Activities',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('All Activities'),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'Gross Motor Skills',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Gross Motor Skills'),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'Fine Motor Skills',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Fine Motor Skills'),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'Communication Skills',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Communication Skills'),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'Sensory Skills',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Sensory Skills'),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
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
              icon: 'assets/icons/activity1.svg',
              currentPage: 0,
              index: 0,
              totalPages: 4,
            ),
            const SizedBox(height: 16),
            ActivityCard(
              day: 'Day 4',
              description:
                  'Spend 10 minutes engaging with your child playing with building blocks',
              icon: 'assets/icons/activity1.svg',
              currentPage: 1,
              index: 0,
              totalPages: 4,
            ),
            const SizedBox(height: 16),
            ActivityCard(
              day: 'Day 4',
              description:
                  'Spend 10 minutes engaging with your child playing with building blocks',
              icon: 'assets/icons/activity1.svg',
              currentPage: 2,
              index: 0,
              totalPages: 4,
            ),
            const SizedBox(height: 16),
            ActivityCard(
              day: 'Daily tips for mama',
              description: 'Drink 12 cups of water (3 litres)',
              icon: 'assets/icons/activity1.svg',
              currentPage: 3,
              index: 1,
              totalPages: 4,
            ),
          ],
        ),
      ),
    );
  }
}
