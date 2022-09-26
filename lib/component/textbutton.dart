import 'package:flutter/material.dart';

class CTextButton extends StatelessWidget {
  final String text;
  final dynamic action;
  final double size;
  final Color btColor;

  const CTextButton(
      {Key? key,
      required this.text,
      this.action,
      required this.size,
      required this.btColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        textStyle: const TextStyle(
          color: Color(0xFFff4f5a),
        ),
      ),
      onPressed: () => action(),
      child: Text(
        text,
        style: TextStyle(
          color: btColor,
          fontSize: size,
        ),
      ),
    );
  }
}






          // TextButton(
          //   style: TextButton.styleFrom(
          //     splashFactory: NoSplash.splashFactory,
          //     textStyle: const TextStyle(
          //       color: Color(0xFFff4f5a),
          //     ),
          //   ),
          //   onPressed: () {},
          //   child: const Text(
          //     'Login',
          //     style: TextStyle(
          //       color: Color(0xFFff4f5a),
          //     ),
          //   ),
          // ),