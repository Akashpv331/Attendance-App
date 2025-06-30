
import 'package:flutter/material.dart';

import 'package:ziya_inter_project/constant/app_constants.dart';
import 'package:ziya_inter_project/view/widget/Appbar_widget.dart';
import 'package:ziya_inter_project/view/widget/Info_widget.dart';
import 'package:ziya_inter_project/view/widget/LegendBox.dart';
import 'package:ziya_inter_project/view/widget/calendar_widget.dart';
import 'package:ziya_inter_project/view/widget/search_popup.dart';

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

void showTopPopup() {
  _popupOverlay = OverlayEntry(
    builder: (context) => PopupOverlayWidget(
      onClose: hideTopPopup,
    ),
  );

  Overlay.of(context).insert(_popupOverlay!);
}

void hideTopPopup() {
  _popupOverlay?.remove();
  _popupOverlay = null;
}
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppColors.backgroundColor,
     appBar: CustomAppBar(title: 'leave application',onSearchTap:  showTopPopup,
        
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
                            child: InfoTile(
                           title:    "Total  Holiday",
                            value:   "18 days",
                            subtitle:   "In a year",
                            icon:   Icons.calendar_month_outlined,
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
                            child: InfoTile(
                             title:  "Upcoming Holidays",
                            value:   "4",
                           subtitle:    "29 days remaining this month",
                           icon:    Icons.calendar_month_outlined,
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
                    LegendBox( label: 'Public',color:  AppColors.green),
                    LegendBox(label: 'Optional',color:  AppColors.yellow),
                    LegendBox(label: 'Company',color:  AppColors.blue),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: AppColors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // child: TableCalendar(
                  //   focusedDay: DateTime.utc(2025, 6, 1),
                  //   firstDay: DateTime.utc(2020, 1, 1),
                  //   lastDay: DateTime.utc(2030, 12, 31),
                  //   headerStyle: const HeaderStyle(
                  //     formatButtonVisible: false,
                  //     titleCentered: true,
                  //     titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  //   ),
                  //   calendarStyle: const CalendarStyle(
                  //     outsideDaysVisible: false,
                  //   ),
                  //   daysOfWeekStyle: const DaysOfWeekStyle(
                  //     weekdayStyle: TextStyle(color: AppColors.black),
                  //     weekendStyle: TextStyle(color: AppColors.black),
                  //   ),
                  //   calendarBuilders: CalendarBuilders(
                  //     dowBuilder: (context, day) {
                  //       if (day.weekday == DateTime.sunday) {
                  //         return const Center(
                  //           child: Text(
                  //             'Sun',
                  //             style: TextStyle(
                  //                 color: AppColors.red, fontWeight: FontWeight.bold),
                  //           ),
                  //         );
                  //       }
                  //       return null;
                  //     },
                  //     defaultBuilder: (context, date, _) {
                  //       final isHoliday = holidayColors
                  //           .containsKey(DateTime.utc(date.year, date.month, date.day));
                  //       final isSunday = date.weekday == DateTime.sunday;

                  //       Color bgColor = AppColors.white;
                  //       TextStyle textStyle = const TextStyle(color: AppColors.black);

                  //       if (isHoliday) {
                  //         bgColor = holidayColors[
                  //             DateTime.utc(date.year, date.month, date.day)]!;
                  //         textStyle = const TextStyle(
                  //             color: AppColors.white, fontWeight: FontWeight.bold);
                  //       } else if (isSunday) {
                  //         textStyle = const TextStyle(color: AppColors.red);
                  //       }

                  //       return Container(
                  //         margin: const EdgeInsets.all(6),
                  //         decoration: BoxDecoration(
                  //           color: bgColor,
                  //           borderRadius: BorderRadius.circular(6),
                  //           border: Border.all(color: Colors.grey.shade300),
                  //         ),
                  //         child: Center(
                  //           child: Text('${date.day}', style: textStyle),
                  //         ),
                  //       );
                  //     },
                  //     todayBuilder: (context, date, _) {
                  //       return Container(
                  //         margin: const EdgeInsets.all(6),
                  //         decoration: BoxDecoration(
                  //           color: AppColors.blue,
                  //           borderRadius: BorderRadius.circular(6),
                  //         ),
                  //         child: Center(
                  //           child: Text(
                  //             '${date.day}',
                  //             style: const TextStyle(
                  //                 color: AppColors.white, fontWeight: FontWeight.bold),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  child:  Container(
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
