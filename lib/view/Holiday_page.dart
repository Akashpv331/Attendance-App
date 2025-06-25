
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';

class HolidayPage extends StatefulWidget {
  const HolidayPage({super.key});

  @override
  State<HolidayPage> createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> {
  final Map<DateTime, Color> holidayColors = {
    DateTime.utc(2025, 6, 3): AppColors.green,
    DateTime.utc(2025, 6, 12): AppColors.green,
    DateTime.utc(2025, 6, 20): AppColors.yellow,
    DateTime.utc(2025, 6, 16): AppColors.blue,
    DateTime.utc(2025, 6, 17): AppColors.blue,
    DateTime.utc(2025, 6, 25): AppColors.blue,
  };

  OverlayEntry? _popupOverlay;

void _showPopup() {
  _popupOverlay = OverlayEntry(
    builder: (context) => Positioned(
     top: 20,
      left: 16,
      right: 16,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap: () {
                     _hidePopup();
                  },
                    child: const Icon(Icons.arrow_back_ios, size: 18)),
                  const SizedBox(width: 8),
                  const Text(
                    '05 May 2025',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Search History',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 12),
             const ListTile(title: Text("Sick Leave.....")),
                  const ListTile(title: Text("23 May 2025...")),
                  const ListTile(title: Text("Casual Leaves...")),

            ],
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(_popupOverlay!);
}

void _hidePopup() {
  _popupOverlay?.remove();
  _popupOverlay = null;
}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_popupOverlay != null) _hidePopup();
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 12,
          title: GestureDetector(
            onTap: () {
              if (_popupOverlay == null) {
                _showPopup();
              } else {
                _hidePopup();
              }
            },
            child: Row(
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
                              style: TextStyle(
                                  color: AppColors.black, fontSize: 14))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.lightBlue,
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
                backgroundImage:
                    NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: AppPadding.screenPadding,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 6,
                          child: Card(
                            color: AppColors.white,
                            child: buildInfoTile(
                              "Total  Holiday",
                              "18 days",
                              "In a year",
                              Icons.calendar_month_outlined,
                              extra: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: AppColors.blue,
                                        borderRadius: const BorderRadius.only(
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
                                            color: const Color.fromARGB(255, 170, 198, 227)),
                                        borderRadius: const BorderRadius.only(
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
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 6,
                          child: Card(
                            color: AppColors.white,
                            child: buildInfoTile(
                              "Upcoming Holidays",
                              "4",
                              "29 days remaining this month",
                              Icons.calendar_month_outlined,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    legendBox('Public', AppColors.green),
                    legendBox('Optional', AppColors.yellow),
                    legendBox('Company', AppColors.blue),
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
                                  color: AppColors.red, fontWeight: FontWeight.bold),
                            ),
                          );
                        }
                        return null;
                      },
                      defaultBuilder: (context, date, _) {
                        final isHoliday = holidayColors
                            .containsKey(DateTime.utc(date.year, date.month, date.day));
                        final isSunday = date.weekday == DateTime.sunday;

                        Color bgColor = AppColors.white;
                        TextStyle textStyle = const TextStyle(color: AppColors.black);

                        if (isHoliday) {
                          bgColor = holidayColors[
                              DateTime.utc(date.year, date.month, date.day)]!;
                          textStyle = const TextStyle(
                              color: AppColors.white, fontWeight: FontWeight.bold);
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
                                  color: AppColors.white, fontWeight: FontWeight.bold),
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
                  children: [
                    TableRow(children: [
                      tableCell("Date", isHeader: true),
                      tableCell("17 June"),
                      tableCell("15 August"),
                      tableCell("23 October"),
                    ]),
                    TableRow(children: [
                      tableCell("Day", isHeader: true),
                      tableCell("Tuesday"),
                      tableCell("Thursday"),
                      tableCell("Wednesday"),
                    ]),
                    TableRow(children: [
                      tableCell("Holiday\n Name", isHeader: true),
                      tableCell("Bakrid"),
                      tableCell("Independence Day"),
                      tableCell("Diwali"),
                    ]),
                    TableRow(children: [
                      tableCell("Type", isHeader: true),
                      tableCell("Public Holiday"),
                      tableCell("National Holiday"),
                      tableCell("Optional"),
                    ]),
                    TableRow(children: [
                      tableCell("Note", isHeader: true),
                      tableCell("Company-wide holiday"),
                      tableCell("Paid Leave"),
                      tableCell("Can be applied"),
                    ]),
                  ],
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoTile(
      String title, String value, String subtitle, IconData icon,
      {Widget? extra}) {
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
          Text(value,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(subtitle,
              style: const TextStyle(fontSize: 11, color: AppColors.grey)),
          if (extra != null) ...[const SizedBox(height: 8), extra],
        ],
      ),
    );
  }

  Widget legendBox(String label, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width / 20,
              height: MediaQuery.of(context).size.height / 48,
              color: color),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
    );
  }

  Widget tableCell(String text, {bool isHeader = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: isHeader ? (color ?? AppColors.blue) : AppColors.grey.shade800
          ,
          fontSize: 13,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
