import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interview_bot/Services/CheckInternet.dart';
import 'package:interview_bot/Services/RESTServices.dart';

import 'package:interview_bot/Services/Storage.dart';
import 'package:interview_bot/User%20Screens/homePage/appliedJobsList.dart';
import 'package:interview_bot/User%20Screens/homePage/savedJobsList.dart';
import 'package:interview_bot/login_register/color.dart';
import 'package:interview_bot/login_register/splash_page.dart';

import 'package:interview_bot/Services/globals.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SecureStorage secureStorage = SecureStorage();
  late Future<int> totalSavedJobs, totalAppliedJobs;

  @override
  void initState() {
    totalSavedJobs = fetchSavedJobs(context);
    totalAppliedJobs = fetchAppliedJobs(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cardTextStyle = TextStyle(
        fontFamily: "Gotham",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return WillPopScope(
        child: Scaffold(
          body: Center(
            child: Stack(
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
                Container(
                  child: isInternet("No Internet Connection Available", globals.isOnline),
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
                                    finalFirstName.toString() +
                                        " " +
                                        finalLastName.toString(),
                                    style: TextStyle(
                                        fontFamily: 'GothamBook Bold',
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    finalEmail.toString(),
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
                                    FutureBuilder(
                                        future: totalSavedJobs,
                                        builder: (BuildContext context,
                                            AsyncSnapshot<int> snapshot) {
                                          if (!snapshot.hasData)
                                            return CircularProgressIndicator();
                                          return Text(
                                            '${snapshot.data}',
                                            style: TextStyle(
                                              fontFamily: 'GothamBook Bold',
                                              color: Colors.black,
                                              fontSize: 25,
                                            ),
                                          );
                                        }),
                                    Text(
                                      'Saved Jobs',
                                      style: cardTextStyle,
                                    ),
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
                                    FutureBuilder(
                                        future: totalAppliedJobs,
                                        builder: (BuildContext context,
                                            AsyncSnapshot<int> snapshot) {
                                          if (!snapshot.hasData)
                                            return CircularProgressIndicator();
                                          return Text(
                                            '${snapshot.data}',
                                            style: TextStyle(
                                              fontFamily: 'GothamBook Bold',
                                              color: Colors.black,
                                              fontSize: 25,
                                            ),
                                          );
                                        }),
                                    Text(
                                      'Applied Jobs',
                                      style: cardTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SavedJobsList()));
                                },
                                child: Card(
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AppliedJobsList()));
                                },
                                child: Card(
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
                                      ),
                                    ],
                                  ),
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
          ),
        ),
        // block Back button
        onWillPop: () => Future.value(false));
  }
}
