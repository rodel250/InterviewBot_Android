import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/Admin%20Screens/joblist/job_applicant_details.dart';
import 'package:interview_bot/Services/CheckInternet.dart';
import 'package:interview_bot/Services/RESTServices.dart';
import 'package:interview_bot/model/viewApplicants.dart';

import 'package:interview_bot/Services/globals.dart' as globals;

class JobApplicants extends StatefulWidget {
  final int jobId;
  JobApplicants(this.jobId);
  @override
  State<StatefulWidget> createState() => _JobApplicantsState(jobId);
}

class _JobApplicantsState extends State<JobApplicants> {
  late Future<List<ViewApplicants>> jobApplicants;
  int jobId;

  _JobApplicantsState(this.jobId);

  @override
  void initState() {
    super.initState();
    jobApplicants = getJobApplicants(jobId, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Job Applicants",
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
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              child: FutureBuilder<List<ViewApplicants>>(
              future: jobApplicants,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                // By default, show a loading spinner.
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());
                // Render applicants lists
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data[index];
                    return Card(
                      child: ListTile(
                          leading: Text(
                            data.finalScore.toString() + "%",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "GothamBook Regular",
                                fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            data.user.firstname + " " + data.user.lastname,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 18, fontFamily: "GothamBook Regular"),
                          ),
                          onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => JobApplicantDetail(
                                            data.finalScore.toString(),
                                            data.user.firstname,
                                            data.user.lastname,
                                            data.user.gender,
                                            data.user.email,
                                            data.user.phone)))
                              }),
                    );
                  },
                );
              }),
            ),
            Container(
              child: isInternet("No Internet Connection Available", globals.isOnline),
            ),
          ],
        ),
      ),
    );
  }
}
