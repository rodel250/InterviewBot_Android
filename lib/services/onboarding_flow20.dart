import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_bot/onboarding/create_job20.dart';

enum OnBoardingStages20 {stage1, stage2, stage3, stage4}

List<Page> onGeneratePages(OnBoardingStages20 stage, List<Page> pages) {
  switch(stage) {
    case OnBoardingStages20.stage1:
      return [CreateJob.page()];
    case OnBoardingStages20.stage2:
      return [CreateJob.page(), CreateJob2.page()];
    case OnBoardingStages20.stage3:
      return [CreateJob.page(), CreateJob2.page(), CreateJob3.page()];
    case OnBoardingStages20.stage4:
      return [CreateJob.page(), CreateJob2.page(), CreateJob3.page(), CreateJob4.page()];
    default:
      return [CreateJob.page()];
  }
}

class OnBoardingFlow20 extends StatelessWidget {

  static  Route route() => MaterialPageRoute(builder: (_) => OnBoardingFlow20());

  @override
  Widget build(BuildContext context) {
    return FlowBuilder(
      onGeneratePages: onGeneratePages,
      state: OnBoardingStages20.stage1,
      );
  }
}