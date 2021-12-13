import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

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
      debugShowCheckedModeBanner: false,
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
                      fontFamily: "Gotham"),
                ),
                Container(
                  height: 20.0,
                ),
                Text(
                  'For any Queries, Email us',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF8C383E),
                      fontFamily: "Gotham"
                      //fontWeight: FontWeight.bold,
                      ),
                ),
                Container(
                  height: 15.0,

                ),
                ElevatedButton(

                  onPressed: _sendingMails,
                  child: Text(
                    'Click here',
                    style: TextStyle(fontFamily: "Gotham",fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFFCC00),
                    onPrimary: Colors.black54,
                    padding: const EdgeInsets.all(15.0),
                  ),
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
