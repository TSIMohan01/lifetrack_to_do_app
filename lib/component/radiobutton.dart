import 'package:flutter/material.dart';

enum RepeatTask { never, everyDay, everyWeek, everyMonth, everyYear }

class RadioButtonTask extends StatefulWidget {
  const RadioButtonTask({Key? key}) : super(key: key);

  @override
  State<RadioButtonTask> createState() => _RadioButtonTaskState();
}

class _RadioButtonTaskState extends State<RadioButtonTask> {
  RepeatTask? _repeat = RepeatTask.never;
  Color activeColor = const Color(0xFF21a87d);

  @override
  Widget build(BuildContext context) {
    String change = 'Never';
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Never",
              style: TextStyle(fontSize: 12),
            ),
            Radio(
              activeColor: activeColor,
              value: RepeatTask.never,
              groupValue: _repeat,
              onChanged: (RepeatTask? value) {
                setState(() {
                  _repeat = value;
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Every Day",
              style: TextStyle(fontSize: 12),
            ),
            Radio(
              activeColor: activeColor,
              value: RepeatTask.everyDay,
              groupValue: _repeat,
              onChanged: (RepeatTask? value) {
                setState(() {
                  _repeat = value;
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Every Week",
              style: TextStyle(fontSize: 12),
            ),
            Radio(
              activeColor: activeColor,
              value: RepeatTask.everyWeek,
              groupValue: _repeat,
              onChanged: (RepeatTask? value) {
                setState(() {
                  _repeat = value;
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Every Month",
              style: TextStyle(fontSize: 12),
            ),
            Radio(
              activeColor: activeColor,
              value: RepeatTask.everyMonth,
              groupValue: _repeat,
              onChanged: (RepeatTask? value) {
                setState(() {
                  _repeat = value;
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Every Year",
              style: TextStyle(fontSize: 12),
            ),
            Radio(
              activeColor: activeColor,
              value: RepeatTask.everyYear,
              groupValue: _repeat,
              onChanged: (RepeatTask? value) {
                setState(() {
                  _repeat = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
