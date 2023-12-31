import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../const/text_style.dart';

class CustomContainerButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final void Function()? onTap;
  final Color activeBackgroundColor;
  final Color activeForegroundColor;
  final Color disableBackgroundColor;
  final Color disableForegroundColor;
  final Color? borderColor;
  final double textPadding;
  final double? width;

  const CustomContainerButton({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.activeBackgroundColor = MyColor.primary,
    this.activeForegroundColor = MyColor.whiteText,
    this.disableBackgroundColor = MyColor.lightGrey,
    this.disableForegroundColor = MyColor.darkGrey,
    this.borderColor,
    this.textPadding = 16.0,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: isSelected ? activeBackgroundColor : disableBackgroundColor,
          border: borderColor == null
              ? null
              : Border.all(
                  width: 1.0,
                  color: borderColor!,
                ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(textPadding),
          child: Text(
            title,
            style: MyTextStyle.bodyBold.copyWith(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color:
                  isSelected ? activeForegroundColor : disableForegroundColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
