//task tracker page

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';

class ExactTaskTrackerUI extends StatefulWidget {
  const ExactTaskTrackerUI({super.key});

  @override
  State<ExactTaskTrackerUI> createState() => _ExactTaskTrackerUIState();
}

class _ExactTaskTrackerUIState extends State<ExactTaskTrackerUI> {
  final Map<String, String> _selectedStatus = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),

        // Task Cards
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(bottom: 16),
            children: [
              buildTaskTracker(
                  "Responsive Design", "45%", "2 days \nremaining", "Medium"),
              buildTaskTracker(
                  "UI/UX Design", "69%", "2 days\n remaining", "High"),
              buildTaskTracker(
                  "Back-end Development", "0%", "1 day \nremaining", "Medium"),
            ],
          ),
        )
      ],
    );
  }

  // Task widget Card
  Widget buildTaskTracker(
      String title, String progress, String deadline, String priority) {
    String? selected = _selectedStatus[title];

    return Card(
      color:AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.green),
                ),
                const Text("Due Date: 18-06-2025",
                    style: TextStyle(color: AppColors.grey)),
              ],
            ),

            const SizedBox(height: 10),

            // Status
            Wrap(
              spacing: 10,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text("Status: "),
                statusChip("Not Started"),
                statusChip("In Progress"),
                statusChip("Completed"),
                statusChip("Overdue"),
              ],
            ),

            const SizedBox(height: 8),

           //prg indicator
            Row(
              children: [
                const Text("Progress: "),
                CircularPercentIndicator(
                  radius: 18.0,
                  lineWidth: 4.0,
                  percent: double.tryParse(progress.replaceAll('%', ''))! / 100,
                  center: Text(
                    progress,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  progressColor:AppColors.green,
                  backgroundColor: AppColors.grey.shade300,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                const SizedBox(width: 15),
                Icon(
                  Icons.add_box_outlined,
                  color: AppColors.orange,
                  size: 13,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(deadline,
                    style: const TextStyle(color: AppColors.orange, fontSize: 12)),
                const SizedBox(width: 15),
                const Icon(Icons.edit, size: 16, color: Colors.grey),
                SizedBox(
                  width: 3,
                ),
                const Text("Assingment\n pending",
                    style: TextStyle(color: AppColors.grey)),
              ],
            ),

            const SizedBox(height: 8),

            // Priority
            Row(
              children: [
                const Text("Priority: "),
                priorityChip("Low", AppColors.black),
                priorityChip("Medium",AppColors.green),
                priorityChip("High", AppColors.black),
              ],
            ),

            const SizedBox(height: 12),

            // Status End Radio Buttons
            Wrap(
              spacing: 16,
              children: [
                statusEnd("Start", AppColors.black, selected, (value) {
                  setState(() {
                    _selectedStatus[title] = value!;
                  });
                }),
                statusEnd("Update", AppColors.green, selected, (value) {
                  setState(() {
                    _selectedStatus[title] = value!;
                  });
                }),
                statusEnd("Completed", AppColors.black, selected, (value) {
                  setState(() {
                    _selectedStatus[title] = value!;
                  });
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Status widget
  Widget statusChip(String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.radio_button_checked_rounded, size: 8),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 8)),
      ],
    );
  }

  // Priority widget
  Widget priorityChip(String label, Color color) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(label, style: TextStyle(color: color)),
    );
  }

  // Radio button widget
  Widget statusEnd(String label, Color color, String? selected,
      ValueChanged<String?> onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: label,
          groupValue: selected,
          onChanged: onChanged,
          activeColor: color,
        ),
        Text(label),
      ],
    );
  }
}
