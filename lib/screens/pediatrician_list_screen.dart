import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../data/pediatricians.dart';
import '../widgets/pediatrician_card.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

var logger = Logger();

class PediatricianListScreen extends StatefulWidget {
  const PediatricianListScreen({super.key});

  @override
  PediatricianListScreenState createState() => PediatricianListScreenState();
}

class PediatricianListScreenState extends State<PediatricianListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // 🔥 Added FocusNode for Search Bar
  final FocusNode _searchFocusNode = FocusNode();

  // 🔥 Search Query State
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchFocusNode.dispose(); // 🔥 Dispose the FocusNode
    super.dispose();
  }

  // 🔥 Filtered Pediatricians List
  List<Map<String, String>> get _filteredPediatricians {
    if (_searchQuery.isEmpty) {
      return pediatricians;
    }
    return pediatricians
        .where(
          (pediatrician) => pediatrician['name']!.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // 🔥 Wrapped with GestureDetector to unfocus when tapping outside
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 🔥 Unfocus the search bar
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFEFEFE),
        // AppBar with BondTime Logo
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: CustomAppBar(),
        ),

        // Main Body with Tabs
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Bar with Dynamic Color Change on Focus
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomSearchBar(
                searchFocusNode: _searchFocusNode,
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query; // 🔥 Update search query
                  });
                },
              ),
            ),

            // Perfectly Aligned Tab Bar to the Extreme Left
            Transform.translate(
              offset: Offset(
                -30,
                0,
              ), // 🔥 Move 20 pixels to the left (Adjust this value)
              child: TabBar(
                controller: _tabController,
                isScrollable:
                    true, // 🔥 Keeps the tabs compact and left-aligned
                labelColor: Colors.black, // 🔥 Active Tab Color to Black
                unselectedLabelColor: Color(
                  0xFFC9C9C9,
                ), // 🔥 Inactive Tab Color to #C9C9C9
                indicator: BoxDecoration(), // 🔥 Removes the underline
                labelStyle: TextStyle(
                  fontFamily: 'InterTight', // 🔥 Updated Font
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // 🔥 Adjust size as needed
                ),
                labelPadding: EdgeInsets.only(
                  right: 15,
                ), // 🔥 Space between the tabs
                // 🔥 Customizing Ripple Effect and Background Color
                splashFactory:
                    NoSplash.splashFactory, // 🔥 Disable Ripple Effect
                overlayColor: WidgetStateProperty.all(
                  Colors.transparent,
                ), // 🔥 No Overlay Color

                tabs: [Tab(text: 'Suggested'), Tab(text: 'Favorites')],
              ),
            ),

            // Tab Views
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Suggested Tab with Filtered Pediatricians
                  ListView.builder(
                    itemCount: _filteredPediatricians.length,
                    itemBuilder: (context, index) {
                      final pediatrician = _filteredPediatricians[index];
                      return PediatricianCard(
                        name: pediatrician['name']!,
                        title: pediatrician['title']!,
                        imagePath: pediatrician['image']!,
                      );
                    },
                  ),

                  // 🔥 Favorites Tab - Displaying Favorited Pediatricians
                  Consumer<FavoritesProvider>(
                    builder: (context, favoritesProvider, child) {
                      // Get list of favorites
                      final favorites = favoritesProvider.favorites;

                      // If no favorites, show a placeholder message
                      if (favorites.isEmpty) {
                        return Center(child: Text('No Favorites Yet'));
                      }

                      // Otherwise, display the list of favorite pediatricians
                      return ListView.builder(
                        itemCount: favorites.length,
                        itemBuilder: (context, index) {
                          final favorite = favorites[index];
                          final name = favorite['name'] ?? 'Unknown';
                          final imagePath =
                              favorite['imagePath'] ??
                              'assets/images/doctor.jpg';

                          // 🔥 Use the new PediatricianCard widget with isFavoriteTab set to true
                          return PediatricianCard(
                            name: name,
                            title:
                                'Consultant Pediatrician', // You can modify this if needed
                            imagePath: imagePath,
                            isFavoriteTab:
                                true, // 🔥 This enables the delete button
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),

        // Bottom Navigation Bar (Fixed at the Bottom)
        bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 3),
      ),
    );
  }
}
