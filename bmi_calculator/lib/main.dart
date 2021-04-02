import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF0a0e21),
        accentColor: Color(0xFFd5802c),
        scaffoldBackgroundColor: Color(0xFF0a0e21),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: InputPage(),
    );
  }
}
