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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE), // Off-White Background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Custom AppBar Height
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              // BondTime Logo at Top-Left
              Positioned(
                top: 35,
                left: 20,
                child: SvgPicture.asset(
                  'assets/icons/bondtime-logo.svg',
                  width: 112,
                  height: 22,
                  fit: BoxFit.contain,
                ),
              ),

              // Arrow-Back Button Below the Logo
              Positioned(
                top: 58,
                left: 3,
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/arrow-back.svg',
                    width: 34,
                    height: 34,
                    colorFilter: ColorFilter.mode(
                      Color(0xFF212529), // Dark Neutral for consistency
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
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Picture Section
            Container(
              width: double.infinity,
              height: 250,
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
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFEFEFE), // Consistent Background Color
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Name and Title
                    Text(
                      'Prof. Ruwan Danishka',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212529),
                        fontFamily: 'InterTight',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Consultant Pediatrician - General Hospital',
                        style: TextStyle(
                          color: Color(0xFF5A87FE),
                          fontFamily: 'InterTight',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Info Cards
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
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
                      ),
                    ),
                    SizedBox(height: 20),

                    // Action Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                              style: TextStyle(fontFamily: 'InterTight'),
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
        border: Border.all(color: Color(0xFFE0E0E0)), // Light grey border
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // White Circle Around SVG Icon
            Container(
              width: 40, // Circle Size
              height: 40, // Circle Size
              decoration: BoxDecoration(
                color: Colors.white, // White Background
                shape: BoxShape.circle, // Circular Shape
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(
                      13,
                    ), // Equivalent to 0.05 opacity
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 24, // Icon Size
                  height: 24, // Icon Size
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    Color(0xFF5A87FE), // BondTime Blue
                    BlendMode.srcIn,
                  ), // Icon Color (BondTime Blue)
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'InterTight',
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'InterTight',
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
