import 'package:flutter/material.dart';
import 'package:lifetrack_to_do_app/component/featuremonthlist.dart';
import 'package:lifetrack_to_do_app/component/textbutton.dart';
import 'package:lifetrack_to_do_app/page/homepage.dart';
import 'package:table_calendar/table_calendar.dart';

const List<dynamic> weekdayName = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];

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
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 100),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),

        // height: 500,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xFFff4f5a),
              ),
              height: 50,
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
              padding: EdgeInsets.only(right: 20, left: 20, top: 15),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...weekdayName.map(
                      (day) => Text(
                        day,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFFc1c1c1),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10, left: 10, top: 15),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: TableCalendar(
                  headerVisible: false,
                  daysOfWeekVisible: false,
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
                  // daysOfWeekStyle: DaysOfWeekStyle(
                  //   weekdayStyle: TextStyle(
                  //     color: Color(0xFFc1c1c1),
                  //   ),
                  //   weekendStyle: TextStyle(
                  //     color: Color(0xFFc1c1c1),
                  //   ),
                  // ),
                  onDaySelected: (DateTime selectDay, DateTime focusDay) {
                    setState(() {
                      selectedDay = selectDay;
                      focusedDay = focusDay;
                      formatted = formatter.format(selectDay);
                    });

                    // widget.formatedTextUpdate(formatter.format(selectDay));
                    // widget.updatedFormattedText(
                    //     widget.state, formatter.format(selectDay));
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
                      color: Color(0xFFff4f5a),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CTextButton(
                    text: "Cancel",
                    size: 14,
                    action: () {
                      Navigator.of(context).pop();
                    },
                    btColor: Color(0xFF727272),
                  ),
                  CTextButton(
                    text: "Done",
                    size: 14,
                    action: () {
                      widget.formatedTextUpdate(formatter.format(selectedDay));
                      widget.updatedFormattedText(
                          widget.state, formatter.format(selectedDay));
                      print(selectedDay);
                      Navigator.of(context).pop();
                    },
                    btColor: Color(0xFFff4f5a),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
