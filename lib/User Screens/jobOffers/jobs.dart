import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/Services/RESTServices.dart';

import 'package:interview_bot/User%20Screens/jobOffers/job_detail.dart';
import 'package:interview_bot/model/jobOfferings.dart';

class Jobs extends StatefulWidget {
  @override
  _JobsState createState() => _JobsState();
}

String jobTitle(JobOfferings job) {
  return "" + job.title;
}

String jobDescription(JobOfferings job) {
  return "" + job.description;
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
      body: SafeArea(
        child: FutureBuilder<List<JobOfferings>>(
            future: jobOfferings,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data[index];
                      return Container(
                        margin: EdgeInsets.fromLTRB(16, 10, 16, 0),
                        child: Stack(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => JobDetail(
                                          jobId: data.id,
                                          jobTitle: data.title,
                                          jobDescription: data.description,
                                          adminEmail: data.admin.email,
                                          adminFirstName: data.admin.firstname,
                                          adminLastName: data.admin.lastname)));
                              },
                              child: Card(
                                elevation: 12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                color: Colors.white,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0, vertical: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: LinearGradient(colors: [
                                      Colors.yellow.shade700,
                                      Colors.yellow.shade300
                                    ]),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/citLogo.png"),
                                            fit: BoxFit.fitWidth,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              jobTitle(snapshot.data[index]),
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontFamily: 'Gotham Bold',
                                                color: Colors.black,
                                              ),
                                            ),
                                            RichText(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              text: TextSpan(
                                                text: jobDescription(
                                                    snapshot.data[index]),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Gotham Regular',
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.navigate_next,
                                        size: 36,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    });
              } else
                return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
