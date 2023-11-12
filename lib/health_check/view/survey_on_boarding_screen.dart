import 'package:flutter/material.dart';

import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_layout.dart';

class SurveyOnBoardingScreen extends StatelessWidget {
  const SurveyOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(title: "내 건강 체크"),
      child: Center(
        child: Text("내 건강 체크"),
      ),
    );
  }
}
