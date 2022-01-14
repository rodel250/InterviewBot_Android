import 'package:flutter/material.dart';

import 'package:interview_bot/User%20Screens/jobOffers/jobs.dart';

class Master extends StatefulWidget {
  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {
  late Widget currentWidgetView;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentWidgetView = Jobs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: currentWidgetView,
          ),
        ),
        onWillPop: () => Future.value(false));
  }
}
