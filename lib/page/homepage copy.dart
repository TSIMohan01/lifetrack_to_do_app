import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lifetrack_to_do_app/component/bottomsheet.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
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
              return StatefulBuilder(
                builder: (context, state) {
                  return BottonSheet();
                },
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

