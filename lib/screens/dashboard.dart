import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/bottom_navbar.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 30, // Reduced padding between back arrow and logo
        title: SvgPicture.asset(
          'assets/icons/BondTime_logo.svg', // Path to your SVG logo
          height: 18, // Match Figma design
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/notifications.svg',
              height: 24,
              width: 24,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                height: 24,
                width: 24,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),

          // Streaks Icon with Number
          Container(
            constraints: BoxConstraints(
              minWidth: 46,   // Minimum width
              minHeight: 28,  // Fixed height
            ),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xFFFED7D7),  // Light red background
              borderRadius: BorderRadius.circular(20), // Full radius for circular shape
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,  // Make width responsive to content
              children: [
                Text(
                  "44", // Streak count
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4),
                SvgPicture.asset(
                  'assets/icons/streaks_icon.svg',
                  height: 18,
                  width: 18,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          SizedBox(width: 16), // Space between icons
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              Text(
                "Good Evening, Juan",
                style: TextStyle(fontSize: 18, fontFamily: 'InterTight'),
              ),

              SizedBox(height: 16),

              // Progress Bar
              Text("Daily Progress", style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Container(
                margin: EdgeInsets.only(left: 32),
                width: 316,
                height: 9.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey[300],
                ),
                child: Stack(
                  children: [
                    Container(
                      width: 316 * 0.5,
                      height: 9.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Activity Card (with SVG)
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Day 4", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("Spend 10 minutes engaging with your child playing with building blocks"),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.play_circle, size: 40),
                        SvgPicture.asset("assets/icons/notifications.svg", width: 80),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Tips for Mom Card
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Daily tips for mama", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("Drink 12 cups of water (3 litres)"),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Done!"),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Coded Graph (Child Engagement Screen Time)
              Container(
                height: 180,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: BarChart(
                  BarChartData(
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 30)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
                            return Text(days[value.toInt()]);
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    barGroups: [
                      BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 1.2, color: Colors.grey)]),
                      BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 0.8, color: Colors.grey)]),
                      BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 1.5, color: Colors.black)]),
                      BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 0.9, color: Colors.grey)]),
                      BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 1.0, color: Colors.grey)]),
                      BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 1.8, color: Colors.grey)]),
                      BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 0.5, color: Colors.grey)]),
                    ],
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(show: false),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}