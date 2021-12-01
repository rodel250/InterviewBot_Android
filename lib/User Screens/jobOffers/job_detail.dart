import 'package:flutter/material.dart';

import 'package:interview_bot/Services/RESTServices.dart';

// ignore: must_be_immutable
class JobDetail extends StatelessWidget {
  late Future<int> totalSavedJobs;
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
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: Padding(
          padding: EdgeInsets.all(40),
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
                height: 10,
              ),
              Center(
                child: Text(
                  jobTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Gotham Bold',
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  jobDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Gotham Bold',
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Job Owner",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Gotham Bold',
                ),
              ),
              Row(
                children: [
                  Text(
                    adminFirstName + " " + adminLastName,
                    style: TextStyle(
                      fontSize: 15,
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
              Row(
                children: [
                  // Container(
                  //   height: 60,
                  //   width: 60,
                  //   child: Center(
                  //     child: Icon(
                  //       Icons.favorite_border,
                  //       size: 28,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 16,
                  // ),
                  Expanded(
                    child: InkWell(
                      onTap: () => {saveJobOffering(context, jobId)},
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.red[500],
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "SAVE",
                            style: TextStyle(
                              fontSize: 18,
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
