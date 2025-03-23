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

  // GlobalKey to position the dropdown menu under the button
  final GlobalKey _filterKey = GlobalKey();

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
          // Tabs + Filter Row
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tab buttons
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

                // Custom Filter Dropdown Button
                IntrinsicWidth(
                  child: GestureDetector(
                    key: _filterKey,
                    onTap: () async {
                      final RenderBox button = _filterKey.currentContext!
                          .findRenderObject() as RenderBox;
                      final RenderBox overlay = Overlay.of(context)
                          .context
                          .findRenderObject() as RenderBox;
                      final position =
                          button.localToGlobal(Offset.zero, ancestor: overlay);

                      final result = await showMenu<String>(
                        context: context,
                        position: RelativeRect.fromLTRB(
                          position.dx,
                          position.dy + button.size.height,
                          position.dx + button.size.width,
                          position.dy,
                        ),
                        items: <String>[
                          'All',
                          'Gross Motor Skills',
                          'Fine Motor Skills',
                          'Communication Skills',
                          'Sensory Skills',
                        ].map((String value) {
                          return PopupMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: const TextStyle(fontSize: 13)),
                          );
                        }).toList(),
                      );

                      if (result != null) {
                        setState(() {
                          selectedFilter = result;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAEAEA),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            selectedFilter,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.keyboard_arrow_down,
                              size: 18, color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Tab Content
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
