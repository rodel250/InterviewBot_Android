import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/onboarding/create_job5.dart';

enum OnBoardingStages5 {stage1}

List<Page> onGeneratePages(OnBoardingStages5 stage, List<Page> pages) {
  switch(stage) {
    case OnBoardingStages5.stage1:
      return [CreateJob.page()];
    default:
      return [CreateJob.page()];
  }
}

class OnBoardingFlow5 extends StatelessWidget {

  static  Route route() => MaterialPageRoute(builder: (_) => OnBoardingFlow5());

  @override
  Widget build(BuildContext context) {
    return FlowBuilder(
      onGeneratePages: onGeneratePages,
      state: OnBoardingStages5.stage1,
      );
  }
}