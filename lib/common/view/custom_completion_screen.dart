import 'package:flutter/material.dart';
import 'package:health_solution/common/layout/default_appbar.dart';

import '../const/colors.dart';
import '../const/text_style.dart';
import '../layout/default_layout.dart';

class CustomCompletionScreen extends StatelessWidget {
  final String? appBarTitle;
  final String contentTitle;
  final String? contentDescription;
  final Widget actionWidget;

  const CustomCompletionScreen({
    super.key,
    this.appBarTitle,
    required this.contentTitle,
    required this.contentDescription,
    required this.actionWidget,
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
            Center(
              child: Column(
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
                  ),
                  if (contentDescription != null)
                    Text(
                      contentDescription!,
                      style: MyTextStyle.bodyRegular.copyWith(
                        fontSize: 24.0,
                      ),
                    ),
                ],
              ),
            ),
            actionWidget,
          ],
        ),
      ),
    );
  }
}
