import 'package:flutter/material.dart';
import 'package:interview_bot/login_register/color.dart';

// ignore: must_be_immutable
class Header extends StatelessWidget {
  //const Header({Key? key}) : super(key: key);
  var text = "Login";

  Header(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [maroon, maroon],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
      ),
      child: Stack(
        children: [
          Center(
            child:
                Image.asset("assets/images/logo2.png", width: 200, height: 350),
          ),
        ],
      ),
    );
  }
}
