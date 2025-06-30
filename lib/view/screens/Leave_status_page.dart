import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/widget/Barchart_widget.dart';
import 'package:ziya_inter_project/view/widget/Info_widget.dart';
import 'package:ziya_inter_project/view/widget/calendar_widget.dart';

class LeaveStatusPage extends StatelessWidget {
  const LeaveStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<DateTime, Color> holidayColors = {
      DateTime.utc(2025, 6, 3): AppColors.green,
      DateTime.utc(2025, 6, 12): AppColors.green,
      DateTime.utc(2025, 6, 20): AppColors.yellow,
      DateTime.utc(2025, 6, 16): AppColors.red,
      DateTime.utc(2025, 6, 17): AppColors.red,
      DateTime.utc(2025, 6, 25): AppColors.blue,
    };
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
     appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Attendance Calendar"),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            children: [
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: 1.2,
                children: [
                  Card(
                    // widget call
                    color: AppColors.white,
                    child: InfoTile(
                      title: "Total Leave Taken",
                      value: "16 days",
                      subtitle: "10 days remaining this month",
                      icon: Icons.article_outlined,
                      extra: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 6,
                              decoration: BoxDecoration(
                                color: AppColors.blue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(2),
                                  bottomLeft: Radius.circular(2),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 6,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 192, 215, 233),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 170, 198, 227)),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(2),
                                  bottomRight: Radius.circular(2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                      color: AppColors.white,
                      child: InfoTile(
                          title: "Leave Balance",
                          value: "8 Days",
                          subtitle: "29 days remaining this month",
                          icon: Icons.calendar_month_outlined)),
                  Card(
                      color: AppColors.white,
                      child: InfoTile(
                          title: "Pending Request",
                          value: "1 request",
                          subtitle: "29 days remaining this month",
                          icon: Icons.hourglass_empty)),
                  Card(
                      color: AppColors.white,
                      child: InfoTile(
                          title: "Approved Leaves",
                          value: " 5leaves",
                          subtitle: "29 days remaining this month",
                          icon: Icons.check_circle_outline)),
                  Card(
                      color: AppColors.white,
                      child: InfoTile(
                          title: "Rejected Leaves",
                          value: "2 Leaves",
                          subtitle: "29 days remaining this month",
                          icon: Icons.cancel_outlined)),
                  Card(
                      color: AppColors.white,
                      child: InfoTile(
                          title: "Upcoming\n Leaves",
                          value: " 1 leaves",
                          //  "scheduled(jun 25)",
                          subtitle: "29 days remaining this month",
                          icon: Icons.calendar_month_outlined)),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: AppColors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                // child:

                child: CustomCalendar(
                  focusedDay: DateTime.utc(2025, 6, 1),
                  onDaySelected: (day) {},
                  markedDates: holidayColors,
                  showHeader: true,
                  useCircle: false,
                  type: "color",
                ),
              ),
              const SizedBox(height: 10),
              Table(
                border: TableBorder.all(color: Colors.grey.shade400),
                columnWidths: const {
                  0: FlexColumnWidth(1.5),
                  1: FlexColumnWidth(2.5),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(3),
                },
                children: [
                  TableRow(children: [
                    tableCell("Date", isHeader: true),
                    tableCell("Leave Type", isHeader: true),
                    tableCell("Status", isHeader: true),
                    tableCell("Reason", isHeader: true),
                  ]),
                  TableRow(children: [
                    tableCell("10 June"),
                    tableCell("Sick Leave"),
                    tableCell("Approved", color: AppColors.green),
                    tableCell("Fever"),
                  ]),
                  TableRow(children: [
                    tableCell("20 June"),
                    tableCell("Casual Leave"),
                    tableCell("Pending", color: AppColors.orange),
                    tableCell("Family Function"),
                  ]),
                  TableRow(children: [
                    tableCell("01 July"),
                    tableCell("WFH"),
                    tableCell("Rejected", color: AppColors.red),
                    tableCell("No backup"),
                  ]),
                ],
              ),
              const SizedBox(height: 5),
              Card(
                color: AppColors.white,
                child: Container(
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Leave Overview",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                "Your leave distribution for the current year"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              BarChartWidget(label: "Q1", heightPercentage: 20),
                              BarChartWidget(label: "Q2", heightPercentage: 15),
                              BarChartWidget(label: "Q3", heightPercentage: 10),
                              BarChartWidget(label: "Q4", heightPercentage: 10),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: AppColors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Leave days taken",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Divider(
                        thickness: 0.2,
                        color: AppColors.grey,
                      ),
                      Padding(
                        padding: AppPadding.small,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total days:"),
                                Text("20"),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Remaining:"),
                                Text("29"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tableCell(String text, {bool isHeader = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: color ?? (isHeader ? AppColors.blue : Colors.grey.shade700),
          fontSize: 13,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
