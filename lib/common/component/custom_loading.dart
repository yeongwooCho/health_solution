import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../const/text_style.dart';

class CustomLoadingScreen extends StatelessWidget {
  final String title;

  const CustomLoadingScreen({
    Key? key,
    this.title = '잠시만 기다려 주세요.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.barrier,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 80,
          decoration: BoxDecoration(
            color: MyColor.scaffoldBackground,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(
                    color: MyColor.primary,
                  ),
                  // child: Icon(
                  //   Icons.rotate_right_rounded,
                  //   size: 30.0,
                  // ),
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: MyTextStyle.descriptionRegular.copyWith(
                    color: MyColor.defaultText,
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
