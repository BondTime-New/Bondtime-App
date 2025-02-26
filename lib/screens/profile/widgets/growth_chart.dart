import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GrowthChart extends StatelessWidget {
  const GrowthChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.grey[300]!,
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 10,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt().toString(),
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      (value + 1).toInt().toString(),
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    );
                  },
                ),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 70,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 10),
                  const FlSpot(1, 20),
                  const FlSpot(2, 30),
                  const FlSpot(3, 35),
                  const FlSpot(4, 40),
                  const FlSpot(5, 50),
                  const FlSpot(6, 60),
                  const FlSpot(7, 65),
                  const FlSpot(8, 67),
                  const FlSpot(9, 68),
                  const FlSpot(10, 69),
                  const FlSpot(11, 70),
                ],
                isCurved: true,
                color: Colors.blue,
                barWidth: 3,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.3),
                      Colors.blue.withOpacity(0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
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
