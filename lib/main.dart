import 'package:flutter/material.dart';
import 'Screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => BMICalculator(),
      },
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color(0xFF0A0E21),
            secondary: Colors.purple,
          ),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      home: InputPage(),
    );
  }
}
