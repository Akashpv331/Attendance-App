import 'package:flutter/material.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/widget/Appbar_widget.dart';
import 'package:ziya_inter_project/view/widget/Info_widget.dart';
import 'package:ziya_inter_project/view/widget/LegendBox.dart';
import 'package:ziya_inter_project/view/widget/report_attendanceChart.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBar(
          title: 'Report',
          onSearchTap: () => "",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.screenPadding,
            child: Column(  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
                height: MediaQuery.of(context).size.height / 23,
                width: MediaQuery.of(context).size.width / 4,
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new, color: Colors.black),
                    Text("Report")
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: 1.2,
                children: [
                  Card(
                    // widget call
                    color: AppColors.white,
                    child: InfoTile(
                      title: "Total Working\ndays",
                      value: "22 days",
                      subtitle: "",
                      icon: Icons.calendar_month_outlined,
                    ),
                  ),
                  Card(
                      color: AppColors.white,
                      child: InfoTile(
                          title: "Total Hours \n worked",
                          value: "145 hrs",
                          subtitle: "",
                          icon: Icons.hourglass_empty_outlined)),
                  Card(
                      color: AppColors.white,
                      child: InfoTile(
                          title: "Tasks\n Completed",
                          value: "35 this month",
                          subtitle: "",
                          icon: Icons.check_circle_outline_outlined)),
                  Card(
                      color: AppColors.white,
                      child: InfoTile(
                          title: "Average \n Daily Hours",
                          value: " 6.6 hrs/day",
                          subtitle: "",
                          icon: Icons.alarm_sharp)),
                ],
              ),SizedBox(height: 15,),
            
            
              Text("Daily clock-in/ Out Log",style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 8),
                  buildCheckInOutTable(),
                  SizedBox(height: 15,),
                   Text("Attendance",style: TextStyle(fontWeight: FontWeight.bold),),
                   SizedBox(height: 20,),
                    Row(
                  children: [
                    LegendBox( label: 'Present',color:  AppColors.green),
                    LegendBox(label: 'Absence',color:  AppColors.red),
                    LegendBox(label: 'Avg hrs',color:  AppColors.blue),
                  ],
                ),
                SizedBox(height: 20,),
                SizedBox(height: 250,
                  child: AttendanceLineChart())
            
            ]),
          ),
        ));
  }


   Widget buildCheckInOutTable() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          buildTableHeader(),
         SizedBox(height: 10,),
          buildTableRow("June 21", "09:15 AM", "05:45 PM", "8.5 hrs", "Present",
              AppColors.green),
          buildTableRow("June 22", "--", "--", "0 hrs", "Absent", AppColors.red),
          buildTableRow("June 23", "09:30 AM", "04:00 PM", "6.5 hrs", "Half Day",
              AppColors.orange),
        ],
      ),
    );
  }

  Widget buildTableHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Expanded(child: Text("Date", style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(child: Text("Check-in", style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(child: Text("Check-out", style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(child: Text("Total Hrs", style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(child: Text("Status", style: TextStyle(fontWeight: FontWeight.bold))),
      ],
    );
  }

  Widget buildTableRow(String date, String inTime, String outTime, String hrs, String status,
      Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(date)),
          Expanded(child: Text(inTime)),
          Expanded(child: Text(outTime)),
          Expanded(child: Text(hrs)),
          Expanded(child: Text(status, style: TextStyle(color: color))),
        ],
      ),
    );
  }

}
