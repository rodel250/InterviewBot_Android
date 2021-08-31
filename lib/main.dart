import 'package:flutter/material.dart';
import 'package:interview_bot/nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar',
      home: Nav(),
    );
  }
}
