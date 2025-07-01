import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/widget/Notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  
  final List<Map<String, dynamic>> notifications = const [
    {
      'title': 'Missed Punch',
      'message': 'Missed Clock-in Detected. Please update your attendance or contact HR.',
      'icon': Icons.close,
      'color': AppColors.red,
    },
    {
      'title': 'Late Attendance',
      'message': "You're running late! Your clock-in time is beyond the scheduled shift start.",
      'icon': Icons.access_time_filled,
      'color': AppColors.orange,
    },
    {
      'title': 'Daily Summary',
      'message': 'Your attendance today: Clock-in at 9:12 AM, Clock-out at 6:05 PM. Total hours: 8.53',
      'icon': Icons.summarize,
      'color': AppColors.blue,
    },
    {
      'title': 'Leave Approval',
      'message': 'Your leave request for June 15 has been approved. Enjoy your day off!',
      'icon': Icons.check_circle,
      'color': AppColors.green,
    },
    {
      'title': 'Leave Rejection',
      'message': 'Leave request declined. Please check with your manager for details.',
      'icon': Icons.cancel,
      'color': AppColors.red,
    },
    {
      'title': 'Shift Update',
      'message': 'Shift updated: New shift time is 10:00 AM – 7:00 PM, effective from June 14.',
      'icon': Icons.schedule,
      'color': AppColors.lightblue,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context); 
            },
          ),
        ],
      ),
      body:
      Padding(
        padding: AppPadding.screenPadding,
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Notification",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              SizedBox(height: MediaQuery.of(context).size.height/1.2,
              width: double.infinity,
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: notifications.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return NotificationCard(
                      title: notification['title'],
                      message: notification['message'],
                      icon: notification['icon'],
                      color: notification['color'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}