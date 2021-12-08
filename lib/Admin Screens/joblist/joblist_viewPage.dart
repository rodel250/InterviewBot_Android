import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:interview_bot/Admin%20Screens/joblist/job_applicants.dart';
import 'package:interview_bot/Services/RESTServices.dart';
import 'package:interview_bot/login_register/color.dart';
import 'package:interview_bot/login_register/splash_page.dart';

// ignore: must_be_immutable
class JobListViewPage extends StatelessWidget {
  int id = 0;
  String title = "";
  String description = "";

  JobListViewPage(int id, String title, String description) {
    this.id = id;
    this.title = title;
    this.description = description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Full Description",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
                colors: [Colors.yellow.shade700, Colors.yellow.shade300]),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/citLogo.png"),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Gotham Bold',
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  finalFirstName.toString() + " " + finalLastName.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Gotham Regular',
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Gotham Bold',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Gotham Regular',
                ),
              ),
              Expanded(child: Container()),
              FutureBuilder(
                  future: isJobApplicantsEmpty(id, context),
                  builder: (context, snapshot) {
                    if (snapshot.data != null && snapshot.data == false) {
                      return ElevatedButton(
                          onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            JobApplicants(id)))
                              },
                          child: Text("VIEW APPLICANTS"),
                          style: ElevatedButton.styleFrom(
                            primary: maroon,
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                          ));
                    } else {
                      return Container();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
