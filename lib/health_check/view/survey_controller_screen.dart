import 'package:flutter/material.dart';
import 'package:health_solution/common/const/data.dart';
import 'package:health_solution/common/layout/default_layout.dart';
import 'package:health_solution/common/model/screen_arguments.dart';
import 'package:health_solution/common/variable/routes.dart';
import 'package:health_solution/health_check/view/survey_screen.dart';

class SurveyControllerScreen extends StatefulWidget {
  final int index;

  const SurveyControllerScreen({
    super.key,
    required this.index,
  });

  @override
  State<SurveyControllerScreen> createState() => _SurveyControllerScreenState();
}

class _SurveyControllerScreenState extends State<SurveyControllerScreen> {
  @override
  Widget build(BuildContext context) {
    print("completionData $completionData");
    return DefaultLayout(
      child: GestureDetector(
        child: SurveyScreen(
          appBarTitle: surveyData[widget.index][0],
          title: surveyData[widget.index][1],
          items: surveyData[widget.index][2],
          onTapItem: () {
            if (widget.index < 8 && widget.index >= 0) {
              Navigator.of(context).pushReplacementNamed(
                RouteNames.surveyController,
                arguments: ScreenArguments<int>(data: widget.index + 1),
              );
            } else {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RouteNames.surveyCompletion,
                (route) => false,
              );
            }
          },
        ),
      ),
    );
  }
}
