import 'package:flutter/material.dart';

class OngoingTaskListScreen extends StatelessWidget {
  const OngoingTaskListScreen({super.key});

  //  Task Card Widget
  Widget buildOngoingTask(
    BuildContext context,
    String title,
    String status,
    String startDate,
    String endDate,
    String priority,
    Color color,
  ) {
    return Card(color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text("Status: "),
                Text(status, style: const TextStyle(color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text("Assigned date: "),
                Text(startDate, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text("Due date: "),
                Text(endDate, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text("Priority: "),
                    Text(priority, style: TextStyle(color: color)),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 30,
                  width: MediaQuery.of(context).size.width / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      "Mark as Done",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: ListView(
        children: [
          buildOngoingTask(
            context,
            "UI/UX Design",
            "Ongoing Task",
            "12-06-2025",
            "12-08-2025",
            "High",
            Colors.red,
          ),
          buildOngoingTask(
            context,
            "Responsive Design",
            "Pending Task",
            "12-06-2025",
            "18-06-2025",
            "Medium",
            Colors.orangeAccent,
          ),
        ],
      ),
    );
  }
}
