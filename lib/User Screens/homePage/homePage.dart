import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/User%20Screens/aboutUs/aboutus_list_screen.dart';
import 'package:interview_bot/User%20Screens/contactUs/ContactUs.dart';
import 'package:interview_bot/User%20Screens/jobOffers/jobOfferings.dart';
import 'package:interview_bot/User%20Screens/profile/edit_profile.dart';
import '../../login_register/color.dart';
import '../../login_register/loginpage.dart';

class HomePage extends StatefulWidget {
  final UserData userData;
  HomePage(this.userData);

  @override
  _HomePageState createState() => _HomePageState(userData);
}

class _HomePageState extends State<HomePage> {
  UserData userData;
  Map<String, String> headers = new Map();

  _HomePageState(this.userData);

  @override
  void initState() {
    headers["Authorization"] = 'Bearer ${userData.token}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cardTextStyle = TextStyle(
        fontFamily: "Gotham",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [maroon, maroon],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter),
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(100)),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,
                    margin: EdgeInsets.only(bottom: 60),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${userData.firstname} ${userData.lastname}',
                              style: TextStyle(
                                  fontFamily: 'GothamBook Bold',
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Text(
                              '${userData.email}',
                              style: TextStyle(
                                  fontFamily: 'GothamBook Regular',
                                  color: Colors.white,
                                  fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '1',
                                style: TextStyle(
                                    fontFamily: 'GothamBook Bold',
                                    color: Colors.black,
                                    fontSize: 25),
                              ),
                              Text(
                                'Saved Jobs',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '5',
                                style: TextStyle(
                                    fontFamily: 'GothamBook Bold',
                                    color: Colors.black,
                                    fontSize: 25),
                              ),
                              Text(
                                'Applied Jobs',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/images/view_job.svg',
                                width: 50,
                                height: 60,
                              ),
                              Text(
                                'View Saved Jobs',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/images/view_applied.svg',
                                width: 50,
                                height: 60,
                              ),
                              Text(
                                'View Applied Jobs',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        Column(
          children: [
            Flexible(
              child: Wrap(
                spacing: 7.0,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: maroon,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
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
