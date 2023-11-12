import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../const/text_style.dart';

class CustomListCard extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isSuffix;

  const CustomListCard({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isSuffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: MyColor.empty,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                title,
                style: MyTextStyle.bodyBold,
                overflow: TextOverflow.ellipsis,
              )),
              const SizedBox(width: 16.0),
              isSuffix
                  ? const Icon(
                      Icons.chevron_right,
                      size: 30.0,
                    )
                  : const SizedBox(width: 1.0),
            ],
          ),
        ),
      ),
    );
  }
}
