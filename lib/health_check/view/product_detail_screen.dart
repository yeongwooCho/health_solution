import 'package:flutter/material.dart';
import 'package:health_solution/common/const/colors.dart';
import 'package:health_solution/common/const/text_style.dart';
import 'package:health_solution/common/layout/default_appbar.dart';
import 'package:health_solution/common/layout/default_layout.dart';

import '../../common/layout/default_button.dart';

class ProductDetailScreen extends StatelessWidget {
  final List<String> item;

  const ProductDetailScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: DefaultElevatedButton(
          onPressed: () {},
          child: const Text('구매하기'),
        ),
      ),
      appbar: const DefaultAppBar(title: ''),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'asset/img/item_${item[4]}.png',
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    item[0],
                    style: MyTextStyle.bodyRegular,
                  ),
                  Text(
                    item[1],
                    style: MyTextStyle.headTitle,
                  ),
                  Text(
                    item[2],
                    style: MyTextStyle.headTitle
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    item[3],
                    style: MyTextStyle.headTitle,
                  ),
                ],
              ),
            ),
            Container(
              height: 10.0,
              color: MyColor.lightGrey,
            ),
            _Images(selectedItemIndex: int.parse(item[4])),
          ],
        ),
      ),
    );
  }
}

class _Images extends StatelessWidget {
  final int selectedItemIndex;

  const _Images({
    super.key,
    required this.selectedItemIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: getItemCount(index: selectedItemIndex),
          itemBuilder: (BuildContext context, int index) {
            return selectedItemIndex == 2 ? Image.asset(
              'asset/img/product/$selectedItemIndex/${selectedItemIndex}_$index.jpg',
              fit: BoxFit.contain,
              width: double.infinity,
            ): Image.asset(
              'asset/img/product/$selectedItemIndex/${selectedItemIndex}_$index.png',
              fit: BoxFit.contain,
              width: double.infinity,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox();
          },
        ),
      ],
    );
  }

  int getItemCount({required int index}) {
    switch (index) {
      case 0:
        return 8;
      case 1:
        return 22;
      case 2:
        return 21;
      case 3:
        return 4;
      case 4:
        return 7;
      default:
        return 0;
    }
  }
}
