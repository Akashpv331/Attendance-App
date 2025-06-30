
import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';

class BarChartWidget extends StatelessWidget {
  final String label;
  final double heightPercentage;

  const BarChartWidget({
    required this.label,
    required this.heightPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: (heightPercentage / 100) * 200,
          width: MediaQuery.of(context).size.width / 6,
          color: AppColors.blue,
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
