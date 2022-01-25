import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../isInternet.dart';
import 'package:interview_bot/Services/globals.dart' as globals;

// ignore: must_be_immutable
class JobApplicantDetail extends StatelessWidget {
  String score = "",
      firstname = "",
      lastname = "",
      gender = "",
      phone = "",
      email = "";

  JobApplicantDetail(score, firstname, lastname, gender, email, phone) {
    this.score = score;
    this.firstname = firstname;
    this.lastname = lastname;
    this.gender = gender;
    this.email = email;
    this.phone = phone;
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
          "Applicant's Information",
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: isInternet("No Internet Connection Available", globals.isOnline),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Final Score",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Gotham Bold',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "     " + score + "%",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Gotham Regular',
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Gotham Bold',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "     Name: " + firstname + " " + lastname,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Gotham Regular',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "     Gender: " + gender,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Gotham Regular',
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Contact Details",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Gotham Bold',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "     Email: " + email,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Gotham Regular',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "     Phone: " + phone,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Gotham Regular',
                        ),
                      ),
                      Expanded(
                          child:
                              Container()), //to fill the spaces after the description
                    ],
                  ),
                ),
              )
            ],
          ),),
      ),
    );
  }
}
