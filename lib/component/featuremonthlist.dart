import 'package:flutter/material.dart';
import 'package:lifetrack_to_do_app/page/homepage.dart';

class tableHeaderMonths extends StatelessWidget {
  final int currentMonth;

  const tableHeaderMonths({Key? key, required this.currentMonth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
      width: ((width - 140) / 4) * 3,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
