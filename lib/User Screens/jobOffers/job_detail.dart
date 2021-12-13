import 'package:flutter/material.dart';

import 'package:interview_bot/Services/RESTServices.dart';

// ignore: must_be_immutable
class JobDetail extends StatelessWidget {
  final int jobId;
  final String jobTitle,
      jobDescription,
      adminEmail,
      adminFirstName,
      adminLastName;

  JobDetail(
      {required this.jobId,
      required this.jobTitle,
      required this.jobDescription,
      required this.adminEmail,
      required this.adminFirstName,
      required this.adminLastName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                height: 5,
              ),
              Center(
                child: Text(
                  jobTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'Gotham Bold',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  jobDescription,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Gotham Regular',
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Job Owner",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Gotham Bold',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    adminFirstName + " " + adminLastName,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontFamily: 'GothamBook Regular',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    adminEmail,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontFamily: 'GothamBook Regular',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                  child:
                      Container()), //to fill the spaces after the description
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => {saveJobOffering(context, jobId)},
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF8C383E),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "SAVE",
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Gotham Bold',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
