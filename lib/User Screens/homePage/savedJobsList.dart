import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interview_bot/model/jobOfferings.dart';

class SavedJobsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SavedJobListState();
}

class SavedJobListState extends State<SavedJobsList> {
  late Future<List<JobOfferings>> jobOfferings;
  final jobOffersListKey = GlobalKey<SavedJobListState>();

  @override
  void initState() {
    super.initState();
    jobOfferings = getJobOfferingsList();
  }

  Future<List<JobOfferings>> getJobOfferingsList() async {
    final url = "http://10.0.2.2:8000/api/2/saved-jobs/details/";
    final response = await http.get(Uri.parse(url));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();

    List<JobOfferings> jobOfferings = items.map<JobOfferings>((json) {
      return JobOfferings.fromJson(json);
    }).toList();

    return jobOfferings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: jobOffersListKey,
      appBar: AppBar(
        title: Text('Saved Jobs'),
      ),
      body: Center(
        child: FutureBuilder<List<JobOfferings>>(
          future: jobOfferings,
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
                      Icons.bookmarks_sharp,
                      color: Colors.blue,
                      size: 35.0,
                    ),
                    title: Text(
                      data.title,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      data.description,
                      style: TextStyle(fontSize: 14),
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
