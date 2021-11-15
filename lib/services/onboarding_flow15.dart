import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/onboarding/create_job15.dart';

enum OnBoardingStages15 {stage1, stage2, stage3}

List<Page> onGeneratePages(OnBoardingStages15 stage, List<Page> pages) {
  switch(stage) {
    case OnBoardingStages15.stage1:
      return [CreateJob.page()];
    case OnBoardingStages15.stage2:
      return [CreateJob.page(), CreateJob2.page()];
    case OnBoardingStages15.stage3:
      return [CreateJob.page(), CreateJob2.page(), CreateJob3.page()];
    default:
      return [CreateJob.page()];
  }
}

class OnBoardingFlow15 extends StatelessWidget {

  static  Route route() => MaterialPageRoute(builder: (_) => OnBoardingFlow15());

  @override
  Widget build(BuildContext context) {
    return FlowBuilder(
      onGeneratePages: onGeneratePages,
      state: OnBoardingStages15.stage1,
      );
  }
}