import 'package:flutter/material.dart';
import 'package:health_solution/common/const/text_style.dart';

import '../const/colors.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const defaultAppBarHeight = 60.0;
  final String title;
  final List<Widget>? action;
  final Widget? leading;
  final double? elevation;

  const DefaultAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.action,
    this.elevation = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: MyTextStyle.bodyTitleBold,
      ),
      leading: leading,
      actions: action,
      elevation: elevation,
      foregroundColor: MyColor.defaultText,
      backgroundColor: MyColor.scaffoldBackground,
    );
  }

  @override
  Size get preferredSize =>
      const Size(double.infinity, DefaultAppBar.defaultAppBarHeight,);
}
