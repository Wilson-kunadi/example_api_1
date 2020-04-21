import 'package:apii/HomePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static Color mainTheme = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: mainTheme,
      ),
      title: "API Testing",
      home: HomePage(title: 'Parse Data Json'),
    );
  }
}
