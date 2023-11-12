import 'package:flutter/material.dart';
import 'package:health_solution/common/const/colors.dart';

import '../../common/component/custom_text_form_field.dart';
import '../../common/const/text_style.dart';
import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_button.dart';
import '../../common/layout/default_layout.dart';
import '../../common/util/text_validator.dart';

class EmailRegisterScreen extends StatefulWidget {
  const EmailRegisterScreen({super.key});

  @override
  State<EmailRegisterScreen> createState() => _EmailRegisterScreenState();
}

class _EmailRegisterScreenState extends State<EmailRegisterScreen> {
  bool isRequest = false;
  bool isVerify = false;

  String? emailText;
  String? passwordText;
  String? passwordCheckText;
  String? phoneText;
  String? certificationText;

  bool isValidEmail = false; // 중복확인
  bool isVisiblePassword = false; // 패스워드 보이게
  bool isVisiblePasswordCheck = false; // 패스워드 보이게

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '회원가입'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '회원가입을 위해\n계정정보를 입력해 주세요.',
                style: MyTextStyle.headTitle,
              ),
              const SizedBox(height: 40.0),
              CustomTextFormField(
                onChanged: (String? value) {
                  emailText = value;
                  setState(() {});
                },
                onSaved: (String? value) {
                  emailText = value;
                },
                validator: TextValidator.emailValidator,
                title: '이메일',
                hintText: '예) abc@true.com',
                button: DefaultElevatedButton(
                  onPressed: () {},
                  child: const Text('중복확인'),
                ),
                textInputType: TextInputType.emailAddress,
                enabled: isValidEmail ? false : true,
              ),
              const SizedBox(height: 16.0),
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
                  passwordText = value;
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
                  passwordCheckText = value;
                },
                onSaved: (String? value) {
                  passwordCheckText = value;
                },
                validator: (String? value) {
                  return TextValidator.passwordCheckValidator(
                      passwordText, value);
                },
                title: '비밀번호 확인',
                hintText: '영문, 숫자, 특수문자 포함 8~15자',
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                title: '휴대폰 번호',
                hintText: '예) 01012341234',
                button: DefaultElevatedButton(
                  onPressed: isVerify
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
                    phoneText = value;
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
                  button: SizedBox(
                    width: 150.0,
                    child: DefaultElevatedButton(
                      onPressed: () {
                        setState(() {
                          isRequest = false;
                          isVerify = true;
                        });
                      },
                      child: const Text('인증번호 확인'),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      certificationText = value;
                    });
                  },
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    return null;
                  },
                ),
              const SizedBox(height: 48.0),
              DefaultElevatedButton(
                onPressed: emailText != null &&
                        emailText!.isNotEmpty &&
                        isValidEmail == true &&
                        passwordText != null &&
                        passwordText!.isNotEmpty &&
                        passwordCheckText != null &&
                        passwordCheckText!.isNotEmpty &&
                        phoneText != null &&
                        phoneText!.isNotEmpty
                    ? null
                    : () {
                        // Navigator.of(context).pushNamed(
                        //   RouteNames.emailSignUpSub,
                        // );
                      },
                child: const Text('다음'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
