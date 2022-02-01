import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/Services/CheckInternet.dart';
import 'package:interview_bot/Services/RESTServices.dart';

import 'package:interview_bot/login_register/color.dart';
import 'package:interview_bot/model/appliedJobs.dart';

import 'package:interview_bot/Services/globals.dart' as globals;

class AppliedJobsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppliedJobsListState();
}

class AppliedJobsListState extends State<AppliedJobsList> {
  late Future<List<AppliedJobs>> appliedJobs;
  final appliedJobKey = GlobalKey<AppliedJobsListState>();

  @override
  void initState() {
    super.initState();
    appliedJobs = getAppliedJobsList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appliedJobKey,
      appBar: AppBar(
        title: Text('Applied Jobs'),
        backgroundColor: maroon,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              child: FutureBuilder<List<AppliedJobs>>(
                future: appliedJobs,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  // By default, show a loading spinner.
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  // Render job offerings lists
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = snapshot.data[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.assessment_sharp,
                            color: maroon,
                            size: 45.0,
                          ),
                          title: Text(
                            data.job.title.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text(
                            data.finalScore == 0 || data.finalScore == null
                                ? "Interview Forfeited"
                                : data.finalScore.toString() + "%",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
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
