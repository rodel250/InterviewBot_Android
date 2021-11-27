import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:interview_bot/Admin%20Screens/dashboard/chartModel.dart';

class BuildChart extends StatelessWidget {
  final List<JobApplicantsPerJobOfferSeries> data;
  BuildChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<JobApplicantsPerJobOfferSeries, String>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (JobApplicantsPerJobOfferSeries series, _) =>
              series.jobTitle,
          measureFn: (JobApplicantsPerJobOfferSeries series, _) =>
              series.applicants,
          colorFn: (JobApplicantsPerJobOfferSeries series, _) =>
              series.barColor)
    ];

    return charts.BarChart(series, animate: true);
  }
}
