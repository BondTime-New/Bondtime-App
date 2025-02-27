import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Changed from StatelessWidget to StatefulWidget
class PediatricianDetailScreen extends StatefulWidget {
  final String pediatricianName; // 🔥 Added to identify the pediatrician

  const PediatricianDetailScreen({super.key, required this.pediatricianName});

  @override
  State<PediatricianDetailScreen> createState() =>
      _PediatricianDetailScreenState();
}

// Created State Class
class _PediatricianDetailScreenState extends State<PediatricianDetailScreen> {
  // Added State Variable to Track Favorite Status
  bool isFavorite = false;

  // 🔥 NEW: ScrollController and Variables for Opacity and Elevation
  final ScrollController _scrollController = ScrollController();
  double _opacity = 0.0; // Controls AppBar Opacity
  // Controls AppBar Elevation

  @override
  void initState() {
    super.initState();
    // 🔥 NEW: Listener for Scroll Position
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      setState(() {
        // 🔥 UPDATED: Gradually increase opacity and elevation
        _opacity = (offset / 200).clamp(0, 1);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // 🔥 NEW: Dispose ScrollController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE), // Off-White Background
      // Use this to allow body to go behind the AppBar
      extendBodyBehindAppBar: true,

      // 🔥 UPDATED: Transparent AppBar with Dynamic Opacity and Elevation
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          100,
        ), // Custom Height for Floating Effect
        child: Container(
          color: Colors.white.withAlpha(
            (_opacity * 255).toInt(),
          ), // 🔥 Dynamic Opacity
          child: Stack(
            children: [
              // 🔥 Dynamic Elevation for Shadow
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(
                          (_opacity * 0.2 * 255).toInt(),
                        ), // Dynamic Shadow
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),

              // BondTime Logo at Top-Left
              Positioned(
                top: 35,
                left: 20,
                child: SvgPicture.asset(
                  'assets/icons/bondtime-logo.svg',
                  width: 112,
                  height: 22,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    Color(0xFF212529),
                    BlendMode.srcIn,
                  ),
                ),
              ),

              // 🔥 Arrow-Back Button Below the Logo
              Positioned(
                top: 58,
                left: 3,
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/arrow-back.svg',
                    width: 34,
                    height: 34,
                    colorFilter: ColorFilter.mode(
                      Color(0xFF212529), // 🔥 Always Dark Neutral
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),

      // Main Body
      body: SingleChildScrollView(
        controller: _scrollController, // 🔥 NEW: Attach ScrollController
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Picture Section
            Container(
              width: double.infinity,
              height: 323,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/doctor.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Stack(
                children: [
                  // Online Status Badge
                  Positioned(
                    left: 20,
                    bottom: 40,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(25),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.circle, color: Colors.green, size: 10),
                          SizedBox(width: 5),
                          Text(
                            'Online',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                              fontFamily: 'InterTight',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Rating Badge
                  Positioned(
                    left: 100,
                    bottom: 40,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(25),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 14),
                          SizedBox(width: 5),
                          Text(
                            '5.0',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                              fontFamily: 'InterTight',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 🔥 UPDATED: Favorite Button using Consumer<FavoritesProvider>
                  Positioned(
                    right: 20,
                    bottom: 40,
                    child: Consumer<FavoritesProvider>(
                      builder: (context, favoritesProvider, child) {
                        // Check if this pediatrician is in the favorites list
                        bool isFavorite = favoritesProvider.isFavorite(
                          widget.pediatricianName,
                        );

                        return IconButton(
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border, // Toggle Icon
                            color: isFavorite ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            // 🔥 Toggle Favorite Status
                            favoritesProvider.toggleFavorite(
                              widget.pediatricianName,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Overlapping Container
            Transform.translate(
              offset: Offset(0, -38), // Cleaner Overlap
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  20,
                ), // 🔥 Reduced top padding
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFEFEFE), // Consistent Background Color
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Name and Title (Aligned to the Left)
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisSize:
                            MainAxisSize
                                .min, // Compact layout with no extra space
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Prof. Ruwan Danishka',
                            style: TextStyle(
                              fontSize: 20.16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF212529),
                              fontFamily: 'InterTight',
                              height: 1.0, // Tighter line height to reduce gap
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ), // Adjust as needed for tighter spacing
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Consultant Pediatrician - General Hospital',
                              style: TextStyle(
                                fontSize: 16.15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF5A87FE),
                                fontFamily: 'InterTight',
                                height: 1.0, // Tighter line height
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 🔥 Exact 20px Gap Between Name and Title and Info Cards
                    SizedBox(height: 20), // 🔥 Precise and consistent gap
                    // Info Cards
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount =
                              constraints.maxWidth > 600 ? 3 : 2;
                          return GridView.count(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 18,
                            mainAxisSpacing:
                                0, // 🔥 No extra space between rows
                            shrinkWrap: true,
                            padding:
                                EdgeInsets
                                    .zero, // 🔥 No padding inside the GridView
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              infoCard(
                                '200+',
                                'Online Patients',
                                'assets/icons/online-patients.svg',
                              ),
                              infoCard(
                                '30+',
                                'Home Visits',
                                'assets/icons/home-visits.svg',
                              ),
                              infoCard(
                                '2+',
                                'Years Experience',
                                'assets/icons/years-experience.svg',
                              ),
                              infoCard(
                                '12+',
                                'Locations to meet',
                                'assets/icons/locations-to-meat.svg',
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 20),

                    // Action Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Color(0xFF212529),
                              side: BorderSide(color: Color(0xFF212529)),
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Check Availability',
                              style: TextStyle(
                                fontFamily: 'InterTight',
                                fontSize: 17.68,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Book Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'InterTight',
                                fontSize: 17.68,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
    );
  }

  // Info Card Widget (Responsive)
  Widget infoCard(String title, String subtitle, String iconPath) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFF547DE8)), // Light grey border
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0), // Reduced padding for better fit
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // White Circle Around SVG Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(13),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    Color(0xFF5A87FE),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8), // Reduced to save space
            Text(
              title,
              style: TextStyle(
                fontSize: 20.16,
                fontWeight: FontWeight.w500,
                fontFamily: 'InterTight',
              ),
            ),
            SizedBox(height: 4), // Reduced to save space
            // Wrapped in Flexible for better text wrapping
            Flexible(
              child: Text(
                subtitle,
                textAlign: TextAlign.center, // Centered text for better look
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'InterTight',
                  fontSize: 15.01,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
