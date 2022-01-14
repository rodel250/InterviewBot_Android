import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:interview_bot/Admin%20Screens/dashboard/buildChart.dart';
import 'package:interview_bot/Admin%20Screens/dashboard/chartModel.dart';
import 'package:interview_bot/Services/RESTServices.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State {
  late Future<List<JobApplicantsPerJobOfferSeries>> data;
  late List<JobApplicantsPerJobOfferSeries> chartData = [];

  @override
  void initState() {
    super.initState();
    data = getDashboardData();
    futureListToList();
  }

  void futureListToList() {
    getDashboardData().then((value) {
      setState(() {
        value.forEach((element) {
          chartData.add(element);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            body: Padding(
                padding: EdgeInsets.only(
                    left: 20.0, top: 35.0, right: 20.0, bottom: 10.0),
                child: Column(children: <Widget>[
                  Text(
                    "Total Number of Applicants per Job Offering",
                    style: TextStyle(
                      fontFamily: "Gotham Bold",
                      fontSize: 16,
                    ),
                  ),
                  FutureBuilder<List<JobApplicantsPerJobOfferSeries>>(
                      future: data,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData)
                          return Flexible(
                              child:
                                  Center(child: CircularProgressIndicator()));

                        return Expanded(child: BuildChart(data: chartData));
                      })
                ]))),
        // block Back button
        onWillPop: () => Future.value(false));
  }
}
