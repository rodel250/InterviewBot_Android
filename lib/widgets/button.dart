import 'package:flutter/material.dart';
import 'package:interview_bot/login_register/color.dart';

// ignore: must_be_immutable
class MaroonButton extends StatelessWidget {
  var btnText = "";
  var onClick;

  MaroonButton({required this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 180,
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [maroon, maroon],
              end: Alignment.centerLeft,
              begin: Alignment.centerRight),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
