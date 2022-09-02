import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String lable;
  final String labelText;
  const InputBox({Key? key, required this.lable, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lable,
                style: TextStyle(fontSize: 12, color: Color(0xFFb1a9a9)),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                cursorHeight: 20,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFFb1a9a9), width: 1.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelText: labelText,
                  labelStyle: const TextStyle(fontSize: 12),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFFb1a9a9), width: 1.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
