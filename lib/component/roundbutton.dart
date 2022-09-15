import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String text;
  final dynamic action;
  final double fsize;
  final double radius;

  RoundButton({
    Key? key,
    required this.bgColor,
    required this.textColor,
    required this.text,
    this.action,
    required this.fsize,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          // Foreground color
          onPrimary: textColor, // Colors.white,
          // Background color
          primary: bgColor, // const Color(0xFFff4f5a),
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
        onPressed: () => action(),
        child: Text(
          text,
          style: TextStyle(fontSize: fsize),
        ),
      ),
    );
  }
}




          // SizedBox(
          //   width: 290,
          //   height: 45,
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       shape: const StadiumBorder(),
          //       // Foreground color
          //       onPrimary: Colors.white,
          //       // Background color
          //       primary: const Color(0xFFff4f5a),
          //     ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          //     onPressed: () {},
          //     child: const Text('Sign Up'),
          //   ),
          // ),