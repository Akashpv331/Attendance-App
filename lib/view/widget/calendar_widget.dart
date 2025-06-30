import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ziya_inter_project/constant/app_constants.dart';

class CustomCalendar extends StatelessWidget {
  final DateTime focusedDay;
  final void Function(DateTime) onDaySelected;
  final Map<DateTime, dynamic> markedDates;
  final bool showHeader;
  final bool useCircle;
  final String type;

  const CustomCalendar({
    super.key,
    required this.focusedDay,
    required this.onDaySelected,
    required this.markedDates,
    this.showHeader = false,
    this.useCircle = true,
    this.type = "status", // "status" or "color"
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: focusedDay,
      headerVisible: showHeader,
      calendarFormat: CalendarFormat.month,
      selectedDayPredicate: (day) => isSameDay(day, focusedDay),
      onDaySelected: (selectedDay, _) => onDaySelected(selectedDay),
      calendarStyle: const CalendarStyle(
        isTodayHighlighted: false,
        outsideDaysVisible: false,
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekendStyle: TextStyle(color: AppColors.red),
        weekdayStyle: TextStyle(color: AppColors.black),
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, _) {
          final key = DateTime.utc(day.year, day.month, day.day);
          final isMarked = markedDates.containsKey(key);
          final value = markedDates[key];
          final isSunday = day.weekday == DateTime.sunday;

          if (isMarked) {
            Color color = type == "status"
                ? _getStatusColor(value)
                : (value as Color);

            return Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: color,
                shape: useCircle ? BoxShape.circle : BoxShape.rectangle,
                borderRadius: useCircle ? null : BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: Text(
                '${day.day}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            );
          }

          return Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            child: Text(
              '${day.day}',
              style: TextStyle(
                color: isSunday ? AppColors.red : AppColors.black,
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
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
}
