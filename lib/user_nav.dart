import 'package:interview_bot/Admin/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/About Us/aboutus_list_screen.dart';
import 'package:interview_bot/Contact Us/ContactUs.dart';
import 'package:interview_bot/Profile/edit_profile.dart';
import 'package:interview_bot/job_offers/master.dart';

import 'login_register/loginpage.dart';

class UserNav extends StatefulWidget {
  UserData userData;
  UserNav(@required this.userData);

  @override
  _NavState createState() => _NavState(userData);
}

class _NavState extends State<UserNav> {
  UserData userData;
  Map<String, String> headers = new Map();
  int _selectedIndex = 0;

  _NavState(this.userData);

  @override
  void initState() {
    headers["Authorization"] = 'Bearer ${userData.token}';
    super.initState();
  }

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Master(),
    AboutusListScreen(),
    ContactUs(),
    EditProfilePage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Interview Bot',
          style: TextStyle(fontFamily: "assets/fonts/Gotham Bold"),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedItemColor: Color(0xFFFFCC00),
      ),
    );
  }
}









/*
void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Interview Bot';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Job List',
      style: optionStyle,
    ),
    Dashboard(),
    Text(
      'Index 2: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview Bot'),
        backgroundColor: Color(0xFF8C383E),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Job List',
            backgroundColor: Color(0xFF8C383E),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
            backgroundColor: Color(0xFF8C383E),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Color(0xFF8C383E),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFFCC00),
        onTap: _onItemTapped,
      ),
    );
  }
}
*/