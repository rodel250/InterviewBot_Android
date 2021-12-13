import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:interview_bot/Admin%20Screens/dashboard/buildChart.dart';
import 'package:interview_bot/Admin%20Screens/dashboard/chartModel.dart';
import 'package:interview_bot/login_register/color.dart';

class Dashboard extends StatelessWidget {
  // Future<List<JobOfferings>> jobOfferings = getJobOfferingsList();
  // final Future<List<JobApplicantsPerJobOfferSeries>> data;

  final List<JobApplicantsPerJobOfferSeries> data = [
    JobApplicantsPerJobOfferSeries(
      jobTitle: "Static Job",
      applicants: 2,
      barColor: charts.ColorUtil.fromDartColor(maroon),
    ),
    JobApplicantsPerJobOfferSeries(
      jobTitle: "Job",
      applicants: 1,
      barColor: charts.ColorUtil.fromDartColor(maroon),
    ),
    JobApplicantsPerJobOfferSeries(
      jobTitle: "Job 2",
      applicants: 0,
      barColor: charts.ColorUtil.fromDartColor(maroon),
    ),
    JobApplicantsPerJobOfferSeries(
      jobTitle: "Job 3",
      applicants: 5,
      barColor: charts.ColorUtil.fromDartColor(maroon),
    ),
    JobApplicantsPerJobOfferSeries(
      jobTitle: "Job 4",
      applicants: 7,
      barColor: charts.ColorUtil.fromDartColor(maroon),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(
                left: 20.0, top: 35.0, right: 20.0, bottom: 10.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Total Number of Applicants per Job Offering",
                  style: TextStyle(
                    fontFamily: "Gotham Bold",
                    fontSize: 16,
                  ),
                ),
                Expanded(child: BuildChart(data: data))
              ],
            )));
  }
}
