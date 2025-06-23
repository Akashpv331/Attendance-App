import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  Widget buildTaskItem(BuildContext context, String title, String description) {
    return Card(color: AppColors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: AppPadding.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.green,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.black,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: MediaQuery.of(context).size.height / 30,
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:AppColors.blue,
                ),
                child: const Center(
                  child: Text(
                    "Start",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
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
          buildTaskItem(
            context,
            "UI/UX Design Implementation",
            "Translating design specifications into functional and visually appealing user interfaces using technologies like HTML, CSS, and JavaScript.",
          ),
          buildTaskItem(
            context,
            "Responsive Design",
            "Ensuring the app adapts seamlessly to various screen sizes and devices using responsive layouts.",
          ),
          buildTaskItem(
            context,
            "Back-end Development",
            "Managing databases, API integrations, and server-side logic to ensure smooth data flow.",
          ),
        ],
      ),
    );
  }
}