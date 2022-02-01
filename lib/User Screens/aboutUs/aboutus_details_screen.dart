import 'package:interview_bot/Services/CheckInternet.dart';
import 'package:interview_bot/model/AboutUs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:interview_bot/Services/globals.dart' as globals;

class AboutusDetailsScreen extends StatelessWidget {
  final AboutUs aboutUs;

  AboutusDetailsScreen(this.aboutUs);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  aboutUs.imageUrl,
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    aboutUs.title2,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 22.0,fontFamily: "Gotham"),
                  ),
                )
              ],
            ),
            ),
            Container(
              child: isInternet("No Internet Connection Available", globals.isOnline),
            ),
          ],
        ),
        padding: const EdgeInsets.all(0),
      ),
    );
  }
}

