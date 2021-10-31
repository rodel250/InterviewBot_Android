import 'package:flutter/material.dart';
import 'package:Interviewbot/user_nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar',
      theme: ThemeData(
        primaryColor: Color(0xFF8C383E),
      ),
      home: Nav(),
    );
  }
}
