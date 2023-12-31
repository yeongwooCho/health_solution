import 'package:flutter/material.dart';
import 'package:health_solution/common/model/screen_arguments.dart';

import '../../common/component/custom_text_form_field.dart';
import '../../common/const/text_style.dart';
import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_button.dart';
import '../../common/layout/default_layout.dart';
import '../../common/variable/routes.dart';

class FindEmailScreen extends StatefulWidget {
  const FindEmailScreen({super.key});

  @override
  State<FindEmailScreen> createState() => _FindEmailScreenState();
}

class _FindEmailScreenState extends State<FindEmailScreen> {
  bool isRequest = false;
  bool isVerify = false;

  String? phone;
  String? certification;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '이메일 찾기'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8.0),
                const Text(
                  '이메일 찾기를 위해\n본인인증을 진행해 주세요.',
                  style: MyTextStyle.headTitle,
                ),
                const SizedBox(height: 40.0),
                CustomTextFormField(
                  title: '휴대폰 번호',
                  hintText: '예) 01012341234',
                  button: DefaultElevatedButton(
                    onPressed: isVerify || phone == null || phone!.isEmpty
                        ? null
                        : () {
                            setState(() {
                              isRequest = true;
                            });
                          },
                    child: isRequest
                        ? (isVerify ? const Text('인증완료') : const Text('재 전송'))
                        : const Text('인증번호 전송'),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      phone = value;
                    });
                  },
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                  enabled: !isVerify,
                  textInputType: TextInputType.number,
                  maxLength: 11,
                ),
                const SizedBox(height: 4.0),
                if (isRequest && !isVerify)
                  CustomTextFormField(
                    hintText: '인증번호 입력',
                    button: DefaultElevatedButton(
                      onPressed: () {
                        setState(() {
                          isVerify = true;
                        });
                      },
                      child: const Text('인증번호 확인'),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        certification = value;
                      });
                    },
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      return null;
                    },
                  ),
              ],
            ),
            DefaultElevatedButton(
              onPressed: phone == null || phone!.isEmpty || !isVerify
                  ? null
                  : () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteNames.completion,
                        (route) => false,
                        arguments: ScreenArguments<Map<String, String>>(
                          data: {
                            'appBarTitle': '이메일 찾기 완료',
                            'contentTitle': '이메일 확인',
                            'contentDescription': 'health@naver.com',
                          },
                        ),
                      );
                    },
              child: const Text('확인'),
            ),
          ],
        ),
      ),
    );
  }
}
