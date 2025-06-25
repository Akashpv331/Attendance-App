import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/Dashboard_page.dart';

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
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 12,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/logo_ziya.jpg",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Card(
                elevation: 1,
                child: Container(
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: AppColors.black, size: 20),
                      SizedBox(width: 8),
                      Text("Search",
                          style:
                              TextStyle(color: AppColors.black, fontSize: 14))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              CircleAvatar(
                radius: 13,
                backgroundColor: AppColors.lightblue,
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: AppColors.white,
                      size: 16,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Positioned(
                top: 2,
                right: 4,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 4),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/32.jpg'),
            ),
          ),
        ],
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
                    child: buildInfoTile(
                      "Total Leave Taken",
                      "16 days",
                      "10 days remaining this month",
                      Icons.article_outlined,
                      extra: Row(
                        children: [
                          Expanded(
                            flex: 1, // 25%
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
                            flex: 3, // 75%
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
                      child: buildInfoTile(
                          "Leave Balance",
                          "8 Days",
                          "29 days remaining this month",
                          Icons.calendar_month_outlined)),
                  Card(
                      color: AppColors.white,
                      child: buildInfoTile(
                          "Pending Request",
                          "1 request",
                          "29 days remaining this month",
                          Icons.hourglass_empty)),
                  Card(
                      color: AppColors.white,
                      child: buildInfoTile(
                          "Approved Leaves",
                          " 5leaves",
                          "29 days remaining this month",
                          Icons.check_circle_outline)),
                  Card(
                      color: AppColors.white,
                      child: buildInfoTile(
                          "Rejected Leaves",
                          "2 Leaves",
                          "29 days remaining this month",
                          Icons.cancel_outlined)),
                  Card(
                      color: AppColors.white,
                      child: buildInfoTile(
                          "Upcoming\n Leaves",
                          " 1 leaves",
                          titleSmall: "scheduled(jun 25)",
                          "29 days remaining this month",
                          Icons.calendar_month_outlined)),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: AppColors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TableCalendar(
                  focusedDay: DateTime.utc(2025, 6, 1),
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  calendarStyle: const CalendarStyle(
                    outsideDaysVisible: false,
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: AppColors.black),
                    weekendStyle: TextStyle(color: AppColors.black),
                  ),
                  calendarBuilders: CalendarBuilders(
                    dowBuilder: (context, day) {
                      if (day.weekday == DateTime.sunday) {
                        return const Center(
                          child: Text(
                            'Sun',
                            style: TextStyle(
                                color: AppColors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }
                      return null;
                    },
                    defaultBuilder: (context, date, _) {
                      final isHoliday = holidayColors.containsKey(
                          DateTime.utc(date.year, date.month, date.day));
                      final isSunday = date.weekday == DateTime.sunday;

                      Color bgColor = AppColors.white;
                      TextStyle textStyle =
                          const TextStyle(color: AppColors.black);

                      if (isHoliday) {
                        bgColor = holidayColors[
                            DateTime.utc(date.year, date.month, date.day)]!;
                        textStyle = const TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold);
                      } else if (isSunday) {
                        textStyle = const TextStyle(color: AppColors.red);
                      }

                      return Container(
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Center(
                          child: Text('${date.day}', style: textStyle),
                        ),
                      );
                    },
                    todayBuilder: (context, date, _) {
                      return Container(
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            '${date.day}',
                            style: const TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  ),
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

  Widget buildInfoTile(
      String title, String value, String subtitle, IconData icon,
      {Widget? extra, String? titleSmall}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500)),
              ),
              Icon(icon, color: AppColors.blue, size: 18),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(value,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  if (titleSmall != null)
                    Text(
                      titleSmall,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.grey,
                      ),
                    ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Text(subtitle,
                  style: const TextStyle(fontSize: 11, color: AppColors.grey)),
            ],
          ),
          if (extra != null) ...[
            const SizedBox(height: 8),
            extra,
          ],
        ],
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

//chart widget

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
