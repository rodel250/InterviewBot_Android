import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:interview_bot/User%20Screens/user_nav.dart';
import 'package:interview_bot/login_register/color.dart';
import 'package:interview_bot/login_register/splash_page.dart';
import 'package:interview_bot/model/savedJobs.dart';

class SavedJobsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SavedJobListState();
}

class SavedJobListState extends State<SavedJobsList> {
  late Future<List<SavedJobs>> savedJobs;
  final jobOffersListKey = GlobalKey<SavedJobListState>();

  @override
  void initState() {
    super.initState();
    savedJobs = getSavedJobsList();
  }

  Future<List<SavedJobs>> getSavedJobsList() async {
    final url = "http://10.0.2.2:8000/api/" +
        finalUserId.toString() +
        "/saved-jobs/details/";
    final response = await http.get(Uri.parse(url));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();

    List<SavedJobs> savedJobs = items.map<SavedJobs>((json) {
      return SavedJobs.fromJson(json);
    }).toList();

    return savedJobs;
  }

  Future<void> unsaveJobOffering(id) async {
    final url = "http://10.0.2.2:8000/api/saved-jobs/" + id + "/delete/";
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode == 204) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => UserNav()));
    }
  }

  void _showDialog(String id, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(
              "Are you sure you want to unsave this job offering?",
              textAlign: TextAlign.center),
          actions: <Widget>[
            new TextButton(
              child: new Text("UNSAVE"),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                unsaveJobOffering(id);
              },
            ),
            new TextButton(
              child: new Text("CANCEL"),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.grey,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: jobOffersListKey,
      appBar: AppBar(
        title: Text('Saved Jobs'),
        backgroundColor: maroon,
      ),
      body: Center(
        child: FutureBuilder<List<SavedJobs>>(
          future: savedJobs,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // By default, show a loading spinner.
            if (!snapshot.hasData) return CircularProgressIndicator();
            // Render saved jobs lists
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data[index];
                return Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.bookmarks_sharp,
                      color: maroon,
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              _showDialog(data.id.toString(), data.title);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 30,
                            ))
                      ],
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
