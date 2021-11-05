import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interview_bot/login_register/color.dart';
import 'package:interview_bot/login_register/loginpage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [white, white],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter),
      ),
      child: Center(
        child: new Image.asset("assets/images/favicon.png",
            width: 150, height: 150),
      ),
    ));
  }
}
