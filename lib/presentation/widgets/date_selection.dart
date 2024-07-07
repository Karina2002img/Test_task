import 'package:emotions_diary/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:emotions_diary/utils/custom_icon.dart';


class DateSelection extends StatefulWidget implements PreferredSizeWidget {
  const DateSelection({super.key});

  @override
  DateSelectionState createState() => DateSelectionState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class DateSelectionState extends State<DateSelection> {
  DateTime _focusedDate = DateTime.now();
  DateTime? _selectedDate;
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMMM', 'ru').format(_focusedDate);

    return AppBar(
      title: Text(
        formattedDate,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(CustomIcon.calendarIcon),
          onPressed: () => _showCalendarDialog(context),
        ),
      ],
    );
  }

  void _showCalendarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TableCalendar(
                    focusedDay: _focusedDate,
                    firstDay: DateTime(2024),
                    lastDay: DateTime(2030),
                    locale: 'ru_RU',
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDate, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDate = selectedDay;
                        _focusedDate = focusedDay;
                      });
                      Navigator.pop(context);
                    },
                    onPageChanged: (focusedDay) {
                      setState(() {
                        _focusedDate = focusedDay;
                      });
                    },
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      selectedDecoration: const BoxDecoration(
                        color: CustomColors.tangerineColor,
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.tangerineColor.withOpacity(0.4),
                      ),
                      outsideDaysVisible: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
