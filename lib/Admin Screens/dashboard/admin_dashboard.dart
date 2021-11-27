import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:interview_bot/Admin%20Screens/dashboard/buildChart.dart';
import 'package:interview_bot/Admin%20Screens/dashboard/chartModel.dart';
import 'package:interview_bot/login_register/color.dart';

class Dashboard extends StatelessWidget {
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
      padding:
          EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0, bottom: 10.0),
      child: Center(
        child: BuildChart(data: data),
      ),
    ));
  }
}
