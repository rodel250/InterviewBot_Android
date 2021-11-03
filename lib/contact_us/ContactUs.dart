import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(ContactUs());

_sendingMails() async {
  const url = 'mailto:interviewbot.cit@gmail.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 200.0,
                ),
                Text(
                  'Welcome to Interview Bot!',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Color(0xFF8C383E),
                    fontWeight: FontWeight.bold,
                    fontFamily: "assets/fonts/Gotham Bold"
                  ),
                ),
                Container(
                  height: 20.0,
                ),
                Text(
                  'For any Queries, Email us',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF8C383E),
                    fontFamily: "assets/fonts/Gotham Regular"
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 10.0,
                ),
                RaisedButton(
                  onPressed: _sendingMails,
                  child: Text('Click here',style: TextStyle(fontFamily: "assets/fonts/Gotham Regular"),),
                  textColor: Colors.black,
                  padding: const EdgeInsets.all(5.0),
                ),
                Container(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
