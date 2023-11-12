import 'package:flutter/material.dart';

import '../../common/component/custom_list_card.dart';
import '../../common/component/show/show_cupertino_alert.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_style.dart';
import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/variable/routes.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '내 정보'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                color: MyColor.lightGrey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '계정 정보',
                      style: MyTextStyle.bodyRegular.copyWith(
                        color: MyColor.darkGrey,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      'health@naver.com',
                      style: MyTextStyle.bodyTitleBold,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            CustomListCard(
              title: '건강 내역 체크',
              onTap: () {},
              isSuffix: true,
            ),
            CustomListCard(
              title: '회원정보 수정',
              onTap: () {},
              isSuffix: true,
            ),
            CustomListCard(
              title: '1:1 문의',
              onTap: () {},
              isSuffix: true,
            ),
            CustomListCard(
              title: '로그아웃',
              onTap: () {
                showAlert(
                  context: context,
                  titleWidget: Text('로그아웃 하시겠습니까'),
                  completeText: '확인',
                  completeFunction: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RouteNames.emailSignIn,
                      (route) => false,
                    );
                  },
                  cancelText: '취소',
                  cancelFunction: () {
                    Navigator.of(context).pop();
                  },
                );
              },
              isSuffix: false,
            ),
          ],
        ),
      ),
    );
  }
}
