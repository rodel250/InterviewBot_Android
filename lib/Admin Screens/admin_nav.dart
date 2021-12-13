import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/Admin%20Screens/dashboard/admin_dashboard.dart';
import 'package:interview_bot/Admin%20Screens/joblist/admin_joblist.dart';

import 'package:interview_bot/profile/edit_profile.dart';

import '../Services/globals.dart' as globals;

class AdminNav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<AdminNav> {
  @override
  void initState() {
    super.initState();
  }
  
  List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    JobList(),
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
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xFF8C383E),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Job List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: globals.selectedIndex,
        onTap: _onItemTap,
        selectedItemColor: Color(0xFFFFCC00),
      ),
    );
  }
}