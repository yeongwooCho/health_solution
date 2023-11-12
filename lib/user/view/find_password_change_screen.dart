import 'package:flutter/material.dart';
import 'package:health_solution/common/variable/routes.dart';

import '../../common/component/custom_text_form_field.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_style.dart';
import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_button.dart';
import '../../common/layout/default_layout.dart';
import '../../common/model/screen_arguments.dart';
import '../../common/util/text_validator.dart';

class FindPasswordChangeScreen extends StatefulWidget {
  const FindPasswordChangeScreen({super.key});

  @override
  State<FindPasswordChangeScreen> createState() =>
      _FindPasswordChangeScreenState();
}

class _FindPasswordChangeScreenState extends State<FindPasswordChangeScreen> {
  String? passwordText;
  String? passwordCheckText;

  bool isVisiblePassword = false; // 패스워드 보이게
  bool isVisiblePasswordCheck = false; // 패스워드 보이게

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '비밀번호 찾기'),
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
                  '새로운 비밀번호를\n입력해 주세요.',
                  style: MyTextStyle.headTitle,
                ),
                const SizedBox(height: 40.0),
                CustomTextFormField(
                  obscureText: !isVisiblePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      isVisiblePassword = !isVisiblePassword;
                      setState(() {});
                    },
                    icon: Icon(
                      isVisiblePassword
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      color: MyColor.defaultText,
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      passwordText = value;
                    });
                  },
                  onSaved: (String? value) {
                    passwordText = value;
                  },
                  validator: TextValidator.passwordValidator,
                  title: '비밀번호',
                  hintText: '영문, 숫자, 특수문자 포함 8~15자',
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  obscureText: !isVisiblePasswordCheck,
                  suffixIcon: IconButton(
                    onPressed: () {
                      isVisiblePasswordCheck = !isVisiblePasswordCheck;
                      setState(() {});
                    },
                    icon: Icon(
                      isVisiblePasswordCheck
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      color: MyColor.defaultText,
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      passwordCheckText = value;
                    });
                  },
                  onSaved: (String? value) {
                    passwordCheckText = value;
                  },
                  validator: (String? value) {
                    return TextValidator.passwordCheckValidator(
                      passwordText,
                      value,
                    );
                  },
                  title: '비밀번호 확인',
                  hintText: '영문, 숫자, 특수문자 포함 8~15자',
                  textInputType: TextInputType.visiblePassword,
                ),
              ],
            ),
            DefaultElevatedButton(
              onPressed: passwordText == null ||
                      passwordCheckText == null ||
                      passwordText!.isEmpty ||
                      passwordCheckText!.isEmpty
                  ? null
                  : () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteNames.completion,
                        (route) => false,
                        arguments: ScreenArguments<Map<String, String>>(
                          data: {
                            'appBarTitle': '비밀번호 변경 완료',
                            'contentTitle': '비밀번호가 정상적으로\n변경되었습니다.',
                            'contentDescription': '',
                          },
                        ),
                      );
                    },
              child: const Text('비밀번호 변경'),
            ),
          ],
        ),
      ),
    );
  }
}
