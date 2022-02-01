import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/Services/CheckInternet.dart';
import 'package:interview_bot/Services/RESTServices.dart';

import 'package:interview_bot/login_register/color.dart';
import 'package:interview_bot/model/savedJobs.dart';

import 'package:interview_bot/Services/globals.dart' as globals;

class SavedJobsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SavedJobListState();
}

String jobDescription(SavedJobs job) {
  return "" + job.description;
}

class SavedJobListState extends State<SavedJobsList> {
  late Future<List<SavedJobs>> savedJobs;
  final jobOffersListKey = GlobalKey<SavedJobListState>();

  @override
  void initState() {
    super.initState();
    savedJobs = getSavedJobsList(context);
  }

  void _showDialog(String id, String title, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(description, textAlign: TextAlign.center),
          actions: <Widget>[
            new TextButton(
              child: new Text("UNSAVE"),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                unsaveJobOffering(id, context);
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
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
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
                          leading: Container(
                            height: 65,
                            width: 65,
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
                          isThreeLine: true,
                          title: Text(
                            data.title,
                            maxLines: 1,
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            text: TextSpan(
                                text: jobDescription(snapshot.data[index]),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                )),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _showDialog(data.id.toString(), data.title,
                                        data.description);
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
            Container(
              child: isInternet("No Internet Connection Available", globals.isOnline),
            ),
          ],
        ),
      ),
    );
  }
}
