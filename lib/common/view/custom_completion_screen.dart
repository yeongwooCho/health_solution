import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../const/text_style.dart';
import '../layout/default_button.dart';
import '../layout/default_layout.dart';
import '../variable/routes.dart';

class CustomCompletionScreen extends StatelessWidget {
  final String title;

  const CustomCompletionScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60.0),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 48.0,
                    color: MyColor.primary,
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    title,
                    style: MyTextStyle.headTitle,
                  ),
                ],
              ),
            ),
            DefaultElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteNames.root,
                  (route) => false,
                );
              },
              child: const Text('홈으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
