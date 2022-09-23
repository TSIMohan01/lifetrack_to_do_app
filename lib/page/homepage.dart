import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:lifetrack_to_do_app/component/inputbox.dart';
import 'package:lifetrack_to_do_app/component/radiobutton.dart';
import 'package:lifetrack_to_do_app/component/roundbutton.dart';
import 'package:lifetrack_to_do_app/component/textbutton.dart';

const Map<int, String> monthName = {
  1: "Jan",
  2: "Feb",
  3: "Mar",
  4: "Apr",
  5: "May",
  6: "Jun",
  7: "Jul",
  8: "Aug",
  9: "Sep",
  10: "Oct",
  11: "Nov",
  12: "Dec",
};
DateTime nowDate = DateTime.now();
int currYear = nowDate.year;

CalendarFormat format = CalendarFormat.month;
DateTime selectedDay = DateTime.now();
DateTime focusedDay = DateTime.now();

DateFormat formatter = DateFormat('dd.MM.yyyy');
String formatted = formatter.format(selectedDay);

String formattedText = formatter.format(selectedDay);

class HomePageTest extends StatefulWidget {
  const HomePageTest({Key? key}) : super(key: key);

  @override
  State<HomePageTest> createState() => _HomePageTestState();
}

class _HomePageTestState extends State<HomePageTest> {
  DateTime? _date;
  bool isChecked = false;

  bool isExpanded = false;

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    _dateString() {
      if (_date == null) {
        return 'NO';
      } else {
        return '${_date?.day}.${_date?.month}.${_date?.year}';
      }
    }

    void formatedTextUpdate(String _formattedText) {
      setState(() {
        formattedText = _formattedText;
        // loading = !loading;
      });
    }

    print(formattedText + '___45545');
    //device Height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // String formateDate(DateTime _date) {
    //   String _return = (_date.day + '-' + _date.month + '-' + _date.year) as String;
    //   return _return;
    // }
    const Map<int, String> weekdayName = {
      1: "Monday",
      2: "Tuesday",
      3: "Wednesday",
      4: "Thursday",
      5: "Friday",
      6: "Saturday",
      7: "Sunday"
    };

    int currDate = nowDate.day;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFff4f5a),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "$currDate ${monthName[DateTime.now().month]}, ${weekdayName[DateTime.now().weekday]}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Your tasks for the week",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: ExpansionTile(
                      textColor: Color(0xFF0c0c0c),
                      iconColor: Color(0xFF828282),
                      backgroundColor: Color(0xFFf6f6f6),
                      collapsedBackgroundColor: Color(0xFFf6f6f6),
                      title: Container(
                        child: Row(
                          children: [
                            Text(
                              "Today",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "2/7",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFFacacac),
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: LinearPercentIndicator(
                            width: width - 60,

                            lineHeight: 10,
                            progressColor: Color(0xFF21a87d),
                            barRadius: Radius.elliptical(10, 10),
                            percent: 1,

                            // condition ? true block : false block
                            // contion ?? bllock
                            animation: false,
                            animationDuration: 1400,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Material(
                              child: Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Yesterday
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: ExpansionTile(
                      textColor: Color(0xFF0c0c0c),
                      iconColor: Color(0xFF828282),
                      backgroundColor: Color(0xFFf6f6f6),
                      collapsedBackgroundColor: Color(0xFFf6f6f6),
                      title: Container(
                        child: Row(
                          children: [
                            Text(
                              "Yesterday",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "2/7",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFFacacac),
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: LinearPercentIndicator(
                            width: width - 60,

                            lineHeight: 10,
                            progressColor: Color(0xFF21a87d),
                            barRadius: Radius.elliptical(10, 10),
                            percent: 1,

                            // condition ? true block : false block
                            // contion ?? bllock
                            animation: true,
                            animationDuration: 1400,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              void closeBotSheet() => Navigator.pop(context);
              final MediaQueryData mediaQueryData = MediaQuery.of(context);
              return Padding(
                padding: mediaQueryData.viewInsets,
                child: Container(
                  height: 330,
                  color: Colors.transparent,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0))),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(50, 15, 50, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: width * 0.2,
                              height: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Color(0xFFc4c4c4),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            TextFormField(
                              cursorHeight: 20,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                isDense: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFb1a9a9), width: 1.0),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                labelText: '',
                                labelStyle: const TextStyle(fontSize: 12),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFb1a9a9), width: 1.0),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Due date",
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        final result = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2010),
                                          lastDate: DateTime(2050),
                                        );
                                        if (result != null) {
                                          setState(() {
                                            _date = result;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: (width / 3) * 1,
                                        padding: const EdgeInsets.all(9.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xFFb1a9a9))),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(_dateString()),
                                            Icon(Icons.calendar_month),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Repeat",
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return RepeatDialog();
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: (width / 3) * 1,
                                        padding: const EdgeInsets.all(9.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xFFb1a9a9))),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('19.08.2022'),
                                            Icon(Icons.calendar_month),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            RoundButton(
                              bgColor: const Color(0xFF21a87d),
                              textColor: Colors.white,
                              text: "Add New Task",
                              fsize: 12,
                              radius: 5,
                              action: () {},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: closeBotSheet,
                              child: Text(
                                "Back to Task list",
                                style: TextStyle(
                                  color: Color(0xFF909090),
                                ),
                              ),
                            )

                            // ElevatedButton(
                            //   child: const Text('Close BottomSheet'),
                            //   onPressed: () => Navigator.pop(context),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Color(0xFFff4f5a),
      ),
    );
  }
}
// my life my rules

class RepeatDialog extends StatelessWidget {
  const RepeatDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.5),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 410,
            child: Column(
              children: [
                Container(
                  height: 30,
                  decoration: const BoxDecoration(
                      color: Color(0xFFff4f5a),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5))),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Repeat Task",
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const RadioButtonTask(),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CTextButton(
                            size: 18,
                            text: 'Cancel',
                            action: () => Navigator.pop(context),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DueDate extends StatefulWidget {
  void Function(String _formattedText) formatedTextUpdate;
  DueDate({
    Key? key,
    required this.formatedTextUpdate,
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
              height: 50,
              color: Color(0xFFff4f5a),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          ],
        ),
      ),
    );
  }
}

class tableHeaderMonths extends StatelessWidget {
  final int currentMonth;

  const tableHeaderMonths({Key? key, required this.currentMonth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function getNextMonth = (month) => month + 1 > 12 ? 1 : month + 1;

    // Function getNextMonth(month) {
    //   return month + 1 > 12 ? 1 : month + 1;
    // }

    List<dynamic> headerMonths = [];
    headerMonths.add(monthName[currentMonth]);
    headerMonths.add(monthName[getNextMonth(currentMonth + 0)]);
    headerMonths.add(monthName[getNextMonth(currentMonth + 1)]);
    headerMonths.add(monthName[getNextMonth(currentMonth + 2)]);
    headerMonths.add(monthName[getNextMonth(currentMonth + 3)]);

    return Container(
      child: Row(children: [
        ...headerMonths.map(
          (month) => Text(
            month,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        )
      ]),
    );
  }
}
