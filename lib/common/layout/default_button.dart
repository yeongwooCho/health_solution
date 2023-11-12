import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../const/text_style.dart';

class DefaultElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color foregroundColor;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final double? elevation;
  final Size? minimumSize;
  final OutlinedBorder? shape;
  final bool isBorderSide;

  const DefaultElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.foregroundColor = MyColor.whiteText,
    this.backgroundColor = MyColor.primary,
    this.textStyle = MyTextStyle.bodyBold,
    this.elevation = 0.0,
    this.minimumSize = const Size(100, 50),
    this.shape,
    this.isBorderSide = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: isBorderSide ? backgroundColor : foregroundColor,
        backgroundColor: isBorderSide ? foregroundColor : backgroundColor,
        textStyle: textStyle,
        elevation: elevation,
        minimumSize: minimumSize,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: isBorderSide
                  ? BorderSide(width: 2.0, color: backgroundColor)
                  : BorderSide.none,
            ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
