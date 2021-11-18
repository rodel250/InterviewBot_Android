import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:interview_bot/User%20Screens/jobOffers/job_detail.dart';
import 'package:interview_bot/login_register/splash_page.dart';
import 'package:interview_bot/model/jobOfferings.dart';

class Jobs extends StatefulWidget {
  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  late Future<List<JobOfferings>> jobOfferings;
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    jobOfferings = getJobOfferingsList();
  }

  Future<List<JobOfferings>> getJobOfferingsList() async {
    final url = "http://10.0.2.2:8000/api/" +
        finalUserId.toString() +
        "/job-offerings/details/";
    final response = await http.get(Uri.parse(url));
    final items = json.decode(response.body).cast<Map<String, dynamic>>();

    List<JobOfferings> jobOfferings = items.map<JobOfferings>((json) {
      return JobOfferings.fromJson(json);
    }).toList();

    return jobOfferings;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: 32, left: 32, top: 50, bottom: 0),
                  child: Text(
                    "Hi " +
                        finalFirstName! +
                        ", \nPractice your interview skills",
                    style: TextStyle(
                        fontSize: 20, fontFamily: 'Gotham Bold', height: 1.2),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: FutureBuilder<List<JobOfferings>>(
                      future: jobOfferings,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        // By default, show a loading spinner.
                        if (!snapshot.hasData)
                          return CircularProgressIndicator();
                        // Render saved jobs lists
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            var data = snapshot.data[index];
                            return Card(
                              child: ListTile(
                                  leading: Container(
                                    height: 45,
                                    width: 45,
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
                                  title: Text(
                                    data.title,
                                    style: TextStyle(
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
                                                    jobDescription:
                                                        data.description,
                                                    adminEmail:
                                                        data.admin.email,
                                                    adminFirstName:
                                                        data.admin.firstname,
                                                    adminLastName:
                                                        data.admin.lastname)))
                                      }),
                            );
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
