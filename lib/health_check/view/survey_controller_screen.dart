import 'package:flutter/material.dart';
import 'package:health_solution/common/const/data.dart';
import 'package:health_solution/common/layout/default_layout.dart';
import 'package:health_solution/common/model/screen_arguments.dart';
import 'package:health_solution/common/variable/routes.dart';
import 'package:health_solution/health_check/view/survey_screen.dart';

class SurveyControllerScreen extends StatelessWidget {
  final int index;

  const SurveyControllerScreen({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: GestureDetector(
        child: SurveyScreen(
          appBarTitle: surveyData[index][0],
          title: surveyData[index][1],
          items: surveyData[index][2],
          onTapItem: () {
            if (index < 8 && index >= 0) {
              Navigator.of(context).pushReplacementNamed(
                RouteNames.surveyController,
                arguments: ScreenArguments<int>(data: index + 1),
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
