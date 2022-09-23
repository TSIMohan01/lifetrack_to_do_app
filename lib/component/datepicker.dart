import 'package:flutter/material.dart';
import 'package:lifetrack_to_do_app/component/futuremonthlist.dart';
import 'package:lifetrack_to_do_app/component/textbutton.dart';
import 'package:lifetrack_to_do_app/page/homepage%20copy.dart';
import 'package:table_calendar/table_calendar.dart';

class DueDate extends StatefulWidget {
  void Function(String _formattedText) formatedTextUpdate;
  Future<Null> Function(StateSetter updateState, String _formattedText)
      updatedFormattedText;
  StateSetter state;
  DueDate({
    Key? key,
    required this.formatedTextUpdate,
    required this.updatedFormattedText,
    required this.state,
  }) : super(key: key);

  @override
  State<DueDate> createState() => _DueDateState();
}

class _DueDateState extends State<DueDate> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.5),
      ),
      child: Container(
        height: 500,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: 50,
              color: Color(0xFFff4f5a),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  tableHeaderMonths(
                    currentMonth: DateTime.now().month,
                  ),
                  Text(
                    currYear.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                child: TableCalendar(
                  headerVisible: false,
                  focusedDay: selectedDay,
                  firstDay: DateTime(2010),
                  lastDay: DateTime(2050),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  availableGestures: AvailableGestures.none,
                  daysOfWeekHeight: 20,
                  onFormatChanged: (CalendarFormat _format) {
                    setState(() {
                      format = _format;
                    });
                  },
                  onDaySelected: (DateTime selectDay, DateTime focusDay) {
                    setState(() {
                      selectedDay = selectDay;
                      focusedDay = focusDay;
                      formatted = formatter.format(selectDay);
                    });
                    widget.formatedTextUpdate(formatter.format(selectDay));
                    widget.updatedFormattedText(
                        widget.state, formatter.format(selectDay));
                    // print(formatter.format(selectDay));
                  },
                  selectedDayPredicate: (DateTime date) {
                    return isSameDay(selectedDay, date);
                  },
                  calendarStyle: const CalendarStyle(
                    isTodayHighlighted: true,
                    selectedDecoration: BoxDecoration(
                      color: Color(0xFF21a87d),
                      shape: BoxShape.rectangle,
                    ),
                    selectedTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Color(0xFF21a87d),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                CTextButton(
                  text: "OK",
                  size: 12,
                  action: () => Navigator.pop(context),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
