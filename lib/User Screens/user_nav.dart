import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/User%20Screens/aboutUs/aboutus_list_screen.dart';
import 'package:interview_bot/User%20Screens/contactUs/ContactUs.dart';
import 'package:interview_bot/User%20Screens/homePage/homePage.dart';
import 'package:interview_bot/User%20Screens/jobOffers/job_offerings.dart';
import 'package:interview_bot/profile/edit_profile.dart';

import '../Services/globals.dart' as globals;

class UserNav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<UserNav> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Master(),
    AboutusListScreen(),
    ContactUs(),
    EditProfilePage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      globals.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(globals.selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xFF8C383E),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Job Offers',
            backgroundColor: Color(0xFF8C383E),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
            backgroundColor: Color(0xFF8C383E),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Contact Us',
            backgroundColor: Color(0xFF8C383E),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
            backgroundColor: Color(0xFF8C383E),
          ),
        ],
        currentIndex: globals.selectedIndex,
        onTap: _onItemTap,
        selectedItemColor: Color(0xFFFFCC00),
      ),
    );
  }
}
