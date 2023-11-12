import 'package:flutter/material.dart';

class CustomListScreen extends StatelessWidget {
  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;
  final bool shrinkWrap;

  const CustomListScreen({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.shrinkWrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: shrinkWrap,
      // padding: const EdgeInsets.symmetric(vertical: 24.0),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      separatorBuilder: (BuildContext context, int index) {
        // return const Divider();
        return const SizedBox(height: 8.0);
      },
    );
  }
}
