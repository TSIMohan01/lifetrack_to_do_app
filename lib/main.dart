import 'package:flutter/material.dart';
import 'package:lifetrack_to_do_app/page/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        dividerColor: Colors.transparent,
        canvasColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Lifetrack To-do App',
      home: HomePage(),
    );
  }
}
