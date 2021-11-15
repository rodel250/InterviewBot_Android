import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:interview_bot/login_register/color.dart';
import 'package:interview_bot/login_register/splash_page.dart';
import 'package:interview_bot/model/appliedJobs.dart';

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
    appliedJobs = getAppliedJobsList();
  }

  Future<List<AppliedJobs>> getAppliedJobsList() async {
    final url = "http://10.0.2.2:8000/api/" +
        finalUserId.toString() +
        "/applied-jobs/details/";
    final response = await http.get(Uri.parse(url));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();

    List<AppliedJobs> appliedJobs = items.map<AppliedJobs>((json) {
      return AppliedJobs.fromJson(json);
    }).toList();

    return appliedJobs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: appliedJobKey,
      appBar: AppBar(
        title: Text('Applied Jobs'),
        backgroundColor: maroon,
      ),
      body: Center(
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
                      "Job ID: " + data.jobId.toString(),
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
    );
  }
}
