import 'package:flutter/material.dart';
import 'package:lifetrack_to_do_app/component/radiobutton.dart';
import 'package:lifetrack_to_do_app/component/textbutton.dart';

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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CTextButton(
                                size: 14,
                                text: 'OK',
                                action: () => Navigator.pop(context),
                                btColor: Color(0xFFff4f5a),
                              ),
                              CTextButton(
                                size: 14,
                                text: 'Cancel',
                                action: () => Navigator.pop(context),
                                btColor: Color(0xFF727272),
                              ),
                            ],
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
