import 'package:flutter/material.dart';
import '../widgets/activity_card.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int selectedTabIndex = 0; // 0 = Completed, 1 = Today

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
      body: Column(
        children: [
          // Custom Tab Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
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
                            color: selectedTabIndex == 0
                                ? Colors.black
                                : Colors.grey,
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
                          color: selectedTabIndex == 1
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                  color: Color(0xFFEEEEEE),
                ),
              ],
            ),
          ),

          // Tab Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: selectedTabIndex == 0
                  ? Column(
                      // Completed Tab
                      children: [
                        ActivityCard(
                          day: 'Completed Activity 1',
                          description:
                              'Spend 10 minutes engaging with your child playing with building blocks',
                          icon: 'assets/icons/activity1.svg',
                          currentPage: 0,
                          index: 0,
                          totalPages: 4,
                        ),
                        const SizedBox(height: 16),
                        ActivityCard(
                          day: 'Completed Activity 2',
                          description:
                              'Spend 10 minutes engaging with your child playing with building blocks',
                          icon: 'assets/icons/activity1.svg',
                          currentPage: 1,
                          index: 0,
                          totalPages: 4,
                        ),
                      ],
                    )
                  : Column(
                      // Today Tab
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
          ),
        ],
      ),
    );
  }
}
