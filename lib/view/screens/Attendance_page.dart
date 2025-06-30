import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/widget/Overview_widget.dart';
import 'package:ziya_inter_project/view/widget/calendar_widget.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    Map<DateTime, String> statusDates = {
      DateTime.utc(2025, 6, 6): 'late',
      DateTime.utc(2025, 6, 9): 'present',
      DateTime.utc(2025, 6, 10): 'present',
      DateTime.utc(2025, 6, 16): 'present',
      DateTime.utc(2025, 6, 17): 'present',
      DateTime.utc(2025, 6, 24): 'absent',
      DateTime.utc(2025, 6, 25): 'leave',
    };

    Color getStatusColor(String status) {
      switch (status) {
        case 'present':
          return AppColors.green;
        case 'absent':
          return AppColors.red;
        case 'leave':
          return AppColors.orange;
        case 'late':
          return AppColors.blue;
        default:
          return AppColors.black;
      }
    }

    Map<String, double> getPieChart = {
      "20 Days": 20,
      "03 Days": 3,
      "02 Days": 2,
      "06 Days": 6,
    };

    void _goToPreviousMonth() {
      setState(() {
        _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1);
      });
    }

    void _goToNextMonth() {
      setState(() {
        _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
      });
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Attendance Calendar"),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: Padding(
        padding: AppPadding.medium,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: AppColors.grey.shade300),
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: _goToPreviousMonth,
                        child: const Icon(Icons.chevron_left),
                      ),
                      Text(
                        "${_focusedDay.month == 6 ? 'June' : _focusedDay.month}/${_focusedDay.year}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: _goToNextMonth,
                        child: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(
                  12,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: AppColors.grey.shade300),
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // child: TableCalendar(
                  //   firstDay: DateTime.utc(2020, 1, 1),
                  //   lastDay: DateTime.utc(2030, 12, 31),
                  //   focusedDay: _focusedDay,
                  //   calendarFormat: CalendarFormat.month,
                  //   headerVisible: false,
                  //   selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  //   onDaySelected: (selectedDay, focusedDay) {
                  //     setState(() {
                  //       _selectedDay = selectedDay;
                  //       _focusedDay = focusedDay;
                  //     });
                  //   },
                  //   onPageChanged: (focusedDay) {
                  //     _focusedDay = focusedDay;
                  //   },
                  //   calendarStyle: const CalendarStyle(
                  //     isTodayHighlighted: false,
                  //     outsideDaysVisible: false,
                  //   ),
                  //   daysOfWeekStyle: const DaysOfWeekStyle(
                  //     weekendStyle: TextStyle(color: AppColors.red),
                  //     weekdayStyle: TextStyle(color: AppColors.black),
                  //   ),
                  //   calendarBuilders: CalendarBuilders(
                  //     defaultBuilder: (context, day, _) {
                  //       final status = statusDates[
                  //           DateTime.utc(day.year, day.month, day.day)];
                  //       if (status != null) {
                  //         return Container(
                  //           width: 30,
                  //           height: 30,
                  //           decoration: BoxDecoration(
                  //             color: getStatusColor(status),
                  //             shape: BoxShape.circle,
                  //           ),
                  //           alignment: Alignment.center,
                  //           child: Text(
                  //             '${day.day}',
                  //             style: const TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 13),
                  //           ),
                  //         );
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),

             child:      CustomCalendar(
  focusedDay: _focusedDay,
  onDaySelected: (selectedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = selectedDay;
    });
  },
  markedDates: statusDates,
  showHeader: false,
  useCircle: true,
  type: "status",
),

                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: AppColors.white,
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Overview",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Total days: 31",
                            style: TextStyle(color: AppColors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                     

                                Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: const [
    DetailsCard(title: "Presence", subtitle: "20", color: AppColors.green),
    DetailsCard(title: "Absence", subtitle: "03", color: AppColors.red),
    DetailsCard(title: "Leaves", subtitle: "02", color: AppColors.orange),
     DetailsCard(title: "Late", subtitle: "06", color: AppColors.blue),
   
  ],
),
                      const SizedBox(height: 20),

                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: double.infinity,
                        child: PieChart(
                          dataMap: getPieChart,
                          chartRadius: MediaQuery.of(context).size.width / 2.2,
                          colorList: [
                          AppColors.green,
                            AppColors.red,
                            AppColors.orange,
                            AppColors.blue,
                          ],
                          chartType: ChartType.ring,
                          ringStrokeWidth: 90,
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValues: true,
                            showChartValuesInPercentage: false,
                            showChartValueBackground: false,
                            chartValueStyle: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          legendOptions: const LegendOptions(
                            showLegends: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("June 18,2025",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Status: ",
                    style: TextStyle(color: AppColors.grey),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 39,
                    width: MediaQuery.of(context).size.width / 8,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 188, 226, 189),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                        child: const Text("Present",
                            style: TextStyle(color: Colors.green))),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Divider(thickness: .5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.alarm, color: AppColors.green),
                      SizedBox(width: 6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 4),
                          Text(
                            "Check-in",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "09:30 AM",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.forward,
                    color: AppColors.grey,
                  ),
                  Row(
                    children: [
                      Icon(Icons.alarm_off_outlined, color: AppColors.green),
                      SizedBox(width: 6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 4),
                          Text("Check-out",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            "06:00 PM",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 14,
                    width: MediaQuery.of(context).size.width / 3.5,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: .1,
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Work Mode"),
                        Container(
                          height: MediaQuery.of(context).size.height / 39,
                          width: MediaQuery.of(context).size.width / 8,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 210, 219, 237),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                              child: const Text("Office",
                                  style: TextStyle(color: AppColors.blue))),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 14,
                    width: MediaQuery.of(context).size.width / 3.5,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: .1,
                        ),
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Verificaion Mode"),
                        Container(
                          height: MediaQuery.of(context).size.height / 39,
                          width: MediaQuery.of(context).size.width / 8,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 235, 184),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                              child: const Text("Selfie",
                                  style: TextStyle(color: AppColors.orange))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 19),
              Card(
                color: AppColors.white,
                child: ListTile(
                  leading: const Icon(Icons.person_pin_circle_rounded,
                      color: AppColors.red, size: 20),
                  title: const Text("Location",
                      style: TextStyle(color: AppColors.grey)),
                  subtitle: const Text("Lat: 13.05, Long: 80.24"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                color: AppColors.white,
                child: ListTile(
                  leading:
                      const Icon(Icons.note, color: AppColors.grey, size: 20),
                  title: const Text("Notes",
                      style: TextStyle(color: AppColors.grey)),
                  subtitle: const Text("Working on UI bugs Fixing"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

 
 
}
