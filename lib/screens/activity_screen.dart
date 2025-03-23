import 'package:flutter/material.dart';
import '../widgets/activity_card.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int selectedTabIndex = 0;
  String selectedFilter = 'All';

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
      body: Column(
        children: [
          // Tab Row + Filter
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tabs
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

                // Filter dropdown
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: DropdownButton<String>(
                    value: selectedFilter,
                    icon: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.black),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    underline: SizedBox(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedFilter = newValue!;
                      });
                    },
                    items: <String>[
                      'All',
                      'Gross Motor Skills',
                      'Fine Motor Skills',
                      'Communication Skills',
                      'Sensory Skills',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12), // spacing after tabs

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: selectedTabIndex == 0
                  ? Column(
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
