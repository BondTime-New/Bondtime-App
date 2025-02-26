import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // 🔥 Added for SVG support
import 'pediatrician_detail_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';

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

  @override
  Widget build(BuildContext context) {
    // 🔥 Wrapped with GestureDetector to unfocus when tapping outside
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 🔥 Unfocus the search bar
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFEFEFE),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70), // 🔥 Adjusted height for logo
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Positioned(
                  top: 35,
                  left: 20,
                  child: SvgPicture.asset(
                    // 🔥 Replaced with SVG
                    'assets/icons/bondtime-logo.svg',
                    width: 112,
                    height: 22,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Main Body with Tabs
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                focusNode: _searchFocusNode,
                decoration: InputDecoration(
                  hintText: 'Search Pediatricians',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFF5F5F5),
                ),
              ),
            ),

            // Tab Bar for Suggested and Favorites
            TabBar(
              controller: _tabController,
              labelColor: Color(0xFF5A87FE),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xFF5A87FE),
              labelStyle: TextStyle(
                fontFamily: 'InterTight', // 🔥 Updated Font
                fontWeight: FontWeight.bold,
              ),
              tabs: [Tab(text: 'Suggested'), Tab(text: 'Favorites')],
            ),

            // Tab Views
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Suggested Tab
                  ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return _buildPediatricianCard(
                        context,
                        'Prof. Ruwan Danishka',
                        'Consultant Pediatrician',
                        'assets/images/doctor.jpg',
                      );
                    },
                  ),

                  // 🔥 Favorites Tab - Displaying Favorited Pediatricians
                  // 🔥 Updated Favorites Tab with Remove Option
                  // 🔥 Update the Favorites Tab
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
                          final name = favorites[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Profile Image
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                          'assets/images/doctor.jpg',
                                        ),
                                        radius: 35,
                                      ),
                                      SizedBox(width: 15),

                                      // Name and Title
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              name,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'InterTight',
                                              ),
                                            ),
                                            Text(
                                              'Consultant Pediatrician',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: 'InterTight',
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: List.generate(
                                                5,
                                                (index) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // 🔥 Responsive Buttons (Reserve and Remove)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          PediatricianDetailScreen(
                                                            pediatricianName:
                                                                name,
                                                          ),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            child: Text(
                                              'Reserve',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              favoritesProvider.removeFavorite(
                                                name,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),

                                  // 🔥 Action Buttons (Chat and Call) - Responsive Row
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Chat Button
                                      IconButton(
                                        icon: Icon(Icons.chat_bubble_outline),
                                        onPressed: () async {
                                          final Uri smsUri = Uri(
                                            scheme: 'sms',
                                            path: '1234567890',
                                          );
                                          if (await canLaunchUrl(smsUri)) {
                                            await launchUrl(smsUri);
                                          } else {
                                            logger.e(
                                              'Could not launch SMS app',
                                            );
                                          }
                                        },
                                      ),

                                      // Call Button
                                      IconButton(
                                        icon: Icon(Icons.phone),
                                        onPressed: () async {
                                          final Uri telUri = Uri(
                                            scheme: 'tel',
                                            path: '1234567890',
                                          );
                                          if (await canLaunchUrl(telUri)) {
                                            await launchUrl(telUri);
                                          } else {
                                            logger.e(
                                              'Could not launch Phone app',
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 3, // Highlight the current tab
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF5A87FE),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.child_friendly),
              label: 'Bondy',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new),
              label: 'Activities',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              label: 'Pediatricians',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  // Pediatrician Card Widget
  Widget _buildPediatricianCard(
    BuildContext context,
    String name,
    String title,
    String imagePath,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(15.0), // 🔥 Added more padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔥 Row for Name, Title, and Profile Image
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name, Title, and Rating on the left
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InterTight', // 🔥 Updated Font
                        ),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'InterTight', // 🔥 Updated Font
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: List.generate(
                          5,
                          (index) =>
                              Icon(Icons.star, color: Colors.amber, size: 16),
                        ),
                      ),
                    ],
                  ),
                ),

                // 🔥 Profile Image on the right
                CircleAvatar(
                  backgroundImage: AssetImage(imagePath),
                  radius: 40, // Slightly larger profile image
                ),
              ],
            ),

            SizedBox(height: 15), // 🔥 Added more space between sections
            // 🔥 Action Buttons Aligned at the Bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Reserve Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => PediatricianDetailScreen(
                              pediatricianName: name, // 🔥 Pass the Name Here
                            ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: Text(
                    'Reserve',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'InterTight', // 🔥 Updated Font
                      fontSize: 14,
                    ),
                  ),
                ),

                // 🔥 SMS and Call Buttons with SVG Icons
                Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/sms.svg',
                        width: 37,
                        height: 37,
                      ),
                      onPressed: () async {
                        final Uri smsUri = Uri(
                          scheme: 'sms',
                          path: '1234567890',
                        );
                        if (await canLaunchUrl(smsUri)) {
                          await launchUrl(smsUri);
                        } else {
                          logger.e('Could not launch SMS app');
                        }
                      },
                    ),
                    SizedBox(width: 10), // 🔥 Space between icons
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/tel.svg',
                        width: 37,
                        height: 37,
                      ),
                      onPressed: () async {
                        final Uri telUri = Uri(
                          scheme: 'tel',
                          path: '1234567890',
                        );
                        if (await canLaunchUrl(telUri)) {
                          await launchUrl(telUri);
                        } else {
                          logger.e('Could not launch Phone app');
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
