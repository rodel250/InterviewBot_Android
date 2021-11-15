import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/onboarding/create_job10.dart';

enum OnBoardingStages10 {stage1, stage2}

List<Page> onGeneratePages(OnBoardingStages10 stage, List<Page> pages) {
  switch(stage) {
    case OnBoardingStages10.stage1:
      return [CreateJob.page()];
    case OnBoardingStages10.stage2:
      return [CreateJob.page(), CreateJob2.page()];
    default:
      return [CreateJob.page()];
  }
}

class OnBoardingFlow10 extends StatelessWidget {

  static  Route route() => MaterialPageRoute(builder: (_) => OnBoardingFlow10());

  @override
  Widget build(BuildContext context) {
    return FlowBuilder(
      onGeneratePages: onGeneratePages,
      state: OnBoardingStages10.stage1,
      );
  }
}