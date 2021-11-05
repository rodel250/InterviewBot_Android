import 'package:interview_bot/User%20Screens/contactUs/ContactUs.dart';
import 'package:interview_bot/User%20Screens/homePage/homePage.dart';
import 'package:interview_bot/User%20Screens/jobOffers/jobOfferings.dart';
import 'package:interview_bot/User%20Screens/profile/edit_profile.dart';
import 'package:interview_bot/login_register/color.dart';
import 'package:interview_bot/login_register/loginpage.dart';
import 'package:interview_bot/model/AboutUs.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'aboutus_details_screen.dart';

class AboutusListScreen extends StatelessWidget {
  final UserData userData;
  AboutusListScreen(this.userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: aboutusList.length,
          itemBuilder: (context, index) {
            AboutUs aboutUs = aboutusList[index];
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                elevation: 8,
                child: Container(
                  height: 100,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Text(
                        aboutUs.title,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    leading: Image.network(aboutUs.imageUrl2),
                    trailing: Icon(Icons.arrow_forward_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AboutusDetailsScreen(aboutUs)));
                    },
                  ),
                ),
              ),
            );
          }),
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
                        onPrimary: maroon,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    onPressed: () {},
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
                        onPrimary: Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactUs(userData)));
                    },
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
                              builder: (context) => EditProfilePage(userData)));
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
    );
  }
}
