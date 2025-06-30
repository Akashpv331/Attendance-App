import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';

class DetailsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const DetailsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: AppColors.white,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: color),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
