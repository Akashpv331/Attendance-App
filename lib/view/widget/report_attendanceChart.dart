import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';

class AttendanceLineChart extends StatelessWidget {
  const AttendanceLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 10,
        gridData: FlGridData(show: true, drawVerticalLine: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 60,
              
              getTitlesWidget: (value, _) {
                const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                return Text(months[value.toInt()],
                    style: const TextStyle(fontSize: 11));
              },
              interval: 1,
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false),
            
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: AppColors.grey.shade300),
        ),
        lineBarsData: [
          // Present Line
          LineChartBarData(
            spots: [
              FlSpot(0, 7),
              FlSpot(1, 6),
              FlSpot(2, 8),
              FlSpot(3, 7.5),
              FlSpot(4, 8.5),
              FlSpot(5, 7),
              FlSpot(6, 8),
              FlSpot(7, 7.5),
              FlSpot(8, 8),
              FlSpot(9, 8.2),
              FlSpot(10, 9),
              FlSpot(11, 9.5),
            ],
            isCurved: true,
            color: AppColors.green,
            dotData: FlDotData(show: true),
            barWidth: 2,
            belowBarData: BarAreaData(show: false),
          ),
          // Absence Line
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(1, 3.5),
              FlSpot(2, 2.8),
              FlSpot(3, 3),
              FlSpot(4, 2),
              FlSpot(5, 3),
              FlSpot(6, 2.5),
              FlSpot(7, 3.5),
              FlSpot(8, 2.8),
              FlSpot(9, 2.5),
              FlSpot(10, 3),
              FlSpot(11, 2.7),
            ],
            isCurved: true,
            color:AppColors.red,
            dotData: FlDotData(show: true),
            barWidth: 2,
            belowBarData: BarAreaData(show: false),
          ),
          // Avg Hrs Line
          LineChartBarData(
            spots: [
              FlSpot(0, 6),
              FlSpot(1, 6.2),
              FlSpot(2, 6.5),
              FlSpot(3, 6.3),
              FlSpot(4, 6.6),
              FlSpot(5, 6.4),
              FlSpot(6, 6.7),
              FlSpot(7, 6.5),
              FlSpot(8, 6.8),
              FlSpot(9, 6.6),
              FlSpot(10, 7),
              FlSpot(11, 7.2),
            ],
            isCurved: true,
            color: Colors.blueAccent,
            dotData: FlDotData(show: true),
            barWidth: 2,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
