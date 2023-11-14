import 'package:flutter/material.dart';
import 'package:health_solution/common/layout/default_appbar.dart';
import 'package:health_solution/common/layout/default_button.dart';

import '../const/colors.dart';
import '../const/text_style.dart';
import '../layout/default_layout.dart';
import '../variable/routes.dart';

class CustomCompletionScreen extends StatelessWidget {
  final String? appBarTitle;
  final String contentTitle;
  final String? contentDescription;

  const CustomCompletionScreen({
    super.key,
    this.appBarTitle,
    required this.contentTitle,
    this.contentDescription,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: appBarTitle != null ? DefaultAppBar(title: appBarTitle!) : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle,
                  size: 48.0,
                  color: MyColor.primary,
                ),
                const SizedBox(height: 16.0),
                Text(
                  contentTitle,
                  style: MyTextStyle.headTitle,
                  textAlign: TextAlign.center,
                ),
                if (contentDescription != null)
                  const SizedBox(height: 16.0),
                if (contentDescription != null)
                  Text(
                    contentDescription!,
                    style: MyTextStyle.bodyRegular.copyWith(
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
            DefaultElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  appBarTitle == "회원가입 완료" ||
                          appBarTitle == "입력 완료" ||
                          appBarTitle == '구매 완료'
                      ? RouteNames.root
                      : RouteNames.emailSignIn,
                  (route) => false,
                );
              },
              child: appBarTitle == "회원가입 완료" ||
                      appBarTitle == "입력 완료" ||
                      appBarTitle == '구매 완료'
                  ? const Text('홈으로 이동')
                  : const Text('초기화면으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
