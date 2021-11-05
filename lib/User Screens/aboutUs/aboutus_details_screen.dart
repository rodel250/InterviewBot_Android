import 'package:interview_bot/model/AboutUs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutusDetailsScreen extends StatelessWidget {
  final AboutUs aboutUs;

  AboutusDetailsScreen(this.aboutUs);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(aboutUs.title, style: TextStyle(fontSize: 18),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              aboutUs.imageUrl,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                aboutUs.title2,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 22.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}

