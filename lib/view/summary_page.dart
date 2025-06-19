
import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  Widget buildSummaryCard(IconData icon, String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      buildSummaryCard(Icons.calendar_today, "Total Days", "20"),
      buildSummaryCard(Icons.access_time, "Hours Worked", "160 hrs"),
      buildSummaryCard(Icons.av_timer, "Avg Hours", "8 hrs"),
      buildSummaryCard(Icons.bar_chart, "Productivity", "80%"),
      buildSummaryCard(Icons.work, "Projects", "Revenue"),
      buildSummaryCard(Icons.beach_access, "Leave", "2 days"),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 241, 238, 238)),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(12),
                child: GridView.count(
                  crossAxisCount: 3, 
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: .7,
                  shrinkWrap: true, 
                  physics: const NeverScrollableScrollPhysics(), // ✅ Prevents nested scrolling
                  children: items,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
