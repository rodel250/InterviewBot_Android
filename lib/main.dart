import 'package:flutter/material.dart';
import 'package:interview_bot/Admin/nav.dart';
import 'package:interview_bot/user_nav.dart';
import 'package:interview_bot/login_register/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: LoginPage(),
    );

}
}