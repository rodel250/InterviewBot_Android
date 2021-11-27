import 'package:charts_flutter/flutter.dart' as charts;

class JobApplicantsPerJobOfferSeries {
  final String jobTitle;
  final int applicants;
  final charts.Color barColor;

  JobApplicantsPerJobOfferSeries(
      {required this.jobTitle,
      required this.applicants,
      required this.barColor});
}
