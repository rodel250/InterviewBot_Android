import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:interview_bot/User%20Screens/aboutUs/aboutus_list_screen.dart';
import 'package:interview_bot/User%20Screens/homePage/homePage.dart';
import 'package:interview_bot/User%20Screens/jobOffers/jobOfferings.dart';
import 'package:interview_bot/User%20Screens/profile/edit_profile.dart';
import 'package:interview_bot/login_register/color.dart';
import 'package:interview_bot/login_register/loginpage.dart';
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
  final UserData userData;
  ContactUs(this.userData);

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
                      fontFamily: "assets/fonts/Gotham Bold"),
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
                  child: Text(
                    'Click here',
                    style: TextStyle(fontFamily: "assets/fonts/Gotham Regular"),
                  ),
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
        persistentFooterButtons: [
          Column(
            children: [
              Flexible(
                child: Wrap(
                  spacing: 7.0,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(userData)));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Icon(Icons.home),
                          new Text('Home'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Master(userData)));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Icon(Icons.search),
                          new Text('Job Offers'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AboutusListScreen(userData)));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Icon(Icons.info),
                          new Text('About Us'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: maroon,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      onPressed: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Icon(Icons.message),
                          new Text('Contact Us'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditProfilePage(userData)));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Icon(Icons.person),
                          new Text('Me'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
