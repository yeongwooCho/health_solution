import 'package:flutter/material.dart';
import 'package:health_solution/common/const/text_style.dart';

class CategoryContent extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const CategoryContent({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: MyTextStyle.headTitle,
        ),
        const SizedBox(height: 24.0),
        Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 24.0),
        Text(
          description,
          style: MyTextStyle.bodyRegular,
        ),
      ],
    );
  }
}
