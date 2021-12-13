import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/Services/RESTServices.dart';

import 'package:interview_bot/User%20Screens/jobOffers/job_detail.dart';
import 'package:interview_bot/model/jobOfferings.dart';

class Jobs extends StatefulWidget {
  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  late Future<List<JobOfferings>> jobOfferings;

  @override
  void initState() {
    super.initState();
    jobOfferings = getJobOfferingsList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<JobOfferings>>(
            future: jobOfferings,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // By default, show a loading spinner.
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              // Render saved jobs lists
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = snapshot.data[index];
                  return Card(
                    child: ListTile(
                      tileColor: Color(0xFF8C383E),
                        leading: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFCC00),
                            image: DecorationImage(
                              image: AssetImage("assets/images/citLogo.png"),
                              fit: BoxFit.fitWidth,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        title: Text(
                          data.title,
                          style: TextStyle(
                            color: Colors.white,
                              fontSize: 18,
                              fontFamily: "GothamBook Regular"),
                        ),
                        onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JobDetail(
                                          jobId: data.id,
                                          jobTitle: data.title,
                                          jobDescription: data.description,
                                          adminEmail: data.admin.email,
                                          adminFirstName: data.admin.firstname,
                                          adminLastName: data.admin.lastname)))
                            }),
                  );
                },
              );
            }),
      ),
    );
  }
}
