import 'package:flutter/material.dart';
import '../widgets/activity_card.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int selectedTabIndex = 1; // 0 = Completed, 1 = Today

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👇 Tab Bar (Completed / Today)
            Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() => selectedTabIndex = 0),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Text(
                      "Completed",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: selectedTabIndex == 0
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color:
                            selectedTabIndex == 0 ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => selectedTabIndex = 1),
                  child: Text(
                    "Today",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: selectedTabIndex == 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: selectedTabIndex == 1 ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 👇 Keep your original card layout (always show these for now)
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
