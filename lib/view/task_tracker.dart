import 'package:flutter/material.dart';

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
              buildTaskTracker("Responsive Design", "45%", "2 days remaining", "Medium"),
              buildTaskTracker("UI/UX Design", "69%", "2 days remaining", "High"),
              buildTaskTracker("Back-end Development", "0%", "1 day remaining", "Medium"),
            ],
          ),
        )
      ],
    );
  }

  // Task widget Card
  Widget buildTaskTracker(String title, String progress, String deadline, String priority) {
    String? selected = _selectedStatus[title];

    return Card(color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                const Text("Due Date: 18-06-2025", style: TextStyle(color: Colors.grey)),
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

            // Progress
            Row(
              children: [
                const Text("Progress: "),
                const Icon(Icons.pie_chart, size: 18, color: Colors.green),
                const SizedBox(width: 6),
                Text(progress),
                const SizedBox(width: 10),
                Text(deadline, style: const TextStyle(color: Colors.orange)),
                const SizedBox(width: 5),
                const Icon(Icons.edit, size: 16, color: Colors.grey),
                const Text(" pending", style: TextStyle(color: Colors.grey)),
              ],
            ),

            const SizedBox(height: 8),

            // Priority
            Row(
              children: [
                const Text("Priority: "),
                priorityChip("Low", Colors.black),
                priorityChip("Medium", Colors.green),
                priorityChip("High", Colors.black),
              ],
            ),

            const SizedBox(height: 12),

            // Status End Radio Buttons (Replaced Row with Wrap to fix overflow)
            Wrap(
              spacing: 16,
              children: [
                statusEnd("Start", Colors.black, selected, (value) {
                  setState(() {
                    _selectedStatus[title] = value!;
                  });
                }),
                statusEnd("Update", Colors.green, selected, (value) {
                  setState(() {
                    _selectedStatus[title] = value!;
                  });
                }),
                statusEnd("Completed", Colors.black, selected, (value) {
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
  Widget statusEnd(String label, Color color, String? selected, ValueChanged<String?> onChanged) {
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



