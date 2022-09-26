import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lifetrack_to_do_app/component/datepicker.dart';
import 'package:lifetrack_to_do_app/component/repeatdialog.dart';
import 'package:lifetrack_to_do_app/component/roundbutton.dart';
import 'package:lifetrack_to_do_app/page/homepage.dart';

class BottonSheet extends StatefulWidget {
  BottonSheet({Key? key}) : super(key: key);

  @override
  State<BottonSheet> createState() => _BottonSheetState();
}

DateTime now = DateTime.now();
String formattedDate = DateFormat('dd.MM.yyyy').format(now);

class _BottonSheetState extends State<BottonSheet> {
  @override
  Widget build(BuildContext context) {
    void formatedTextUpdate(String _formattedText) {
      setState(() {
        formattedText = _formattedText;
      });
    }

    double width = MediaQuery.of(context).size.width;

    // void closeBotSheet() => Navigator.pop(context);

    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: Container(
        // height: 330,
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
                      color: const Color(0xFFc4c4c4),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    cursorHeight: 20,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFb1a9a9), width: 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelText: '',
                      labelStyle: const TextStyle(fontSize: 12),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFb1a9a9), width: 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  const SizedBox(
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
                          const Text(
                            "Due date",
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              // print(formattedText + '___45545');
                              // showDialog(
                              //   context: context,
                              //   builder: (BuildContext context) {

                              showModalBottomSheet<void>(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(
                                      builder: (context, state) {
                                        return SafeArea(
                                          child: Wrap(
                                            children: [
                                              DueDate(
                                                formatedTextUpdate:
                                                    formatedTextUpdate,
                                                updatedFormattedText:
                                                    updatedFormattedText,
                                                state: (void Function() fn) {},
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  });
                            },
                            child: Container(
                              width: (width / 3) * 1,
                              padding: const EdgeInsets.all(9.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Color(0xFFb1a9a9))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    formattedText.toString(),
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                  const Icon(Icons.calendar_month),
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
                          const Text(
                            "Repeat",
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const RepeatDialog();
                                },
                              );
                            },
                            child: Container(
                              width: (width / 3) * 1,
                              padding: const EdgeInsets.all(9.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Color(0xFFb1a9a9))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('19.08.2022'),
                                  Icon(Icons.arrow_circle_down_outlined),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
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
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      formattedText = formattedDate;
                      // print(formattedDate);
                      Navigator.of(context).pop();
                    },
                    child: const Text(
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
  }
}

Future<Null> updatedFormattedText(
    StateSetter updateState, String _formattedText) async {
  updateState(() {
    formattedText = _formattedText;
  });
}
