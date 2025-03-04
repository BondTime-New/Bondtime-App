import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class DailyTimeChart extends StatelessWidget {
  final List<double> timeSpent;
  final int selectedDayIndex;
  final Function(int) onDaySelected;

  const DailyTimeChart({
    required this.timeSpent,
    required this.selectedDayIndex,
    required this.onDaySelected,
  });

  // ✅ Adjusted Start Date (First day in the list)
  static final DateTime startDate = DateTime(2025, 2, 17); // Monday, Feb 17, 2025

  // ✅ Formats Date Dynamically Based on Selected Bar
  String getFormattedDate(int index) {
    DateTime selectedDate = startDate.add(Duration(days: index)); // ✅ Correct mapping
    return DateFormat('EEEE, dd MMMM').format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 175, // ✅ Increased height slightly for better spacing
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF111111), width: 1), // ✅ Stroke color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // **Selected Date and Time Spent**
          Text(
            getFormattedDate(selectedDayIndex), // ✅ Now shows correct date
            style: TextStyle(fontSize: 12, color: Color(0xFFC1C1C1)),
          ),
          SizedBox(height: 4),
          Text(
            _formatTime(timeSpent[selectedDayIndex]), // ✅ Formats time correctly
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 12),

          // **Bar Chart**
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 2.0, // Max 2 hours
                barTouchData: BarTouchData(
                  touchCallback: (FlTouchEvent event, barTouchResponse) {
                    if (barTouchResponse != null &&
                        barTouchResponse.spot != null &&
                        event is FlTapUpEvent) {
                      int tappedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
                      onDaySelected(tappedIndex);
                    }
                  },
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)), // ✅ Removed left titles
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        List<String> days = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];
                        return Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            days[value.toInt()],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: selectedDayIndex == value.toInt()
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize: 24, // ✅ Moved slightly closer to bars
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 2), // ✅ Adjusted padding
                          child: Text(
                            "${value.toInt()}h",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        );
                      },
                    ),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),

                // ✅ **Horizontal Grid Lines Behind Bars**
                gridData: FlGridData(
                  show: true, // ✅ Enables horizontal grid lines
                  drawVerticalLine: false, // ❌ No vertical lines, only horizontal
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey[300]!, // ✅ Light grey lines
                      strokeWidth: 1,
                    );
                  },
                ),

                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    left: BorderSide.none, // ❌ No left border
                    right: BorderSide.none, // ❌ No right border
                    top: BorderSide.none, // ❌ No top border
                    bottom: BorderSide(
                      color: Colors.grey[300]!, // ✅ Bottom border for reference
                      width: 1,
                    ),
                  ),
                ),

                // **Bars Data**
                barGroups: List.generate(7, (index) {
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: timeSpent[index],
                        color: selectedDayIndex == index ? Colors.black : Colors.grey[400],
                        width: 30, // ✅ Adjusted width as per Figma
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6), // ✅ Rounded only top corners
                          topRight: Radius.circular(6),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Formats time correctly (1h 30m instead of 0.5h)
  String _formatTime(double hours) {
    int h = hours.floor();
    int minutes = ((hours - h) * 60).round();
    if (h > 0 && minutes > 0) {
      return "$h h $minutes m";
    } else if (h > 0) {
      return "$h h";
    } else {
      return "$minutes m";
    }
  }
}