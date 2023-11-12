import 'package:flutter/material.dart';
import 'package:health_solution/common/layout/default_button.dart';

import '../../common/const/text_style.dart';
import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_layout.dart';

class SurveyOnBoardingScreen extends StatelessWidget {
  const SurveyOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(title: "내 건강 체크"),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8.0),
            const Text(
              '내 건강 상태를 체크하기 위해\n설문조사를 진행해 주세요',
              style: MyTextStyle.headTitle,
            ),
            const SizedBox(height: 40.0),
            SizedBox(
              child: Image.asset(
                'asset/img/heart.png',
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 2 / 3,
                height: MediaQuery.of(context).size.width * 2 / 3,
              ),
            ),
            const SizedBox(height: 40.0),
            DefaultElevatedButton(
              onPressed: () {},
              child: const Text('설문조사 시작하기'),
            ),
          ],
        ),
      ),
    );
  }
}
