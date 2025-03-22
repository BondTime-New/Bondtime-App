import 'package:flutter/material.dart';
import '../widgets/activity_card.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int selectedTabIndex = 1; // 0 = Completed, 1 = Today
  String selectedCategory = 'All Activities';

  // Categories for sorting
  final List<String> categories = [
    'All Activities',
    'Gross Motor Skills',
    'Fine Motor Skills',
    'Communication Skills',
    'Sensory Skills',
  ];

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
          // Sorting Dropdown Button
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: DropdownButton<String>(
              value: selectedCategory,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
              dropdownColor: Colors.white,
              style: const TextStyle(color: Colors.black),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tab Buttons (Completed / Today)
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

            // Display activities based on the selected tab and category
            ..._buildCardsForSelectedTab(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCardsForSelectedTab() {
    // Filter activities based on selected category
    List<Map<String, String>> activities = [
      {
        'day': 'Day 4',
        'description':
            'Spend 10 minutes engaging with your child playing with building blocks',
        'icon': 'assets/icons/activity1.svg',
        'category': 'Gross Motor Skills',
      },
      {
        'day': 'Daily tips for mama',
        'description': 'Drink 12 cups of water (3 litres)',
        'icon': 'assets/icons/activity1.svg',
        'category': 'Fine Motor Skills',
      },
      {
        'day': 'Day 4',
        'description':
            'Spend 10 minutes engaging with your child playing with building blocks',
        'icon': 'assets/icons/activity1.svg',
        'category': 'Communication Skills',
      },
      {
        'day': 'Daily tips for mama',
        'description': 'Drink 12 cups of water (3 litres)',
        'icon': 'assets/icons/activity1.svg',
        'category': 'Sensory Skills',
      },
    ];

    // Filter activities based on the selected category
    activities = activities.where((activity) {
      return selectedCategory == 'All Activities' ||
          activity['category'] == selectedCategory;
    }).toList();

    // Return ActivityCard widgets
    return activities.map((activity) {
      return Column(
        children: [
          ActivityCard(
            day: activity['day']!,
            description: activity['description']!,
            icon: activity['icon']!,
            currentPage: 0,
            index: 0,
            totalPages: 4,
          ),
          const SizedBox(height: 16),
        ],
      );
    }).toList();
  }
}
