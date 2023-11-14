import 'package:flutter/material.dart';
import 'package:health_solution/common/component/show/custom_toast.dart';
import 'package:health_solution/common/const/colors.dart';
import 'package:health_solution/common/variable/routes.dart';

import '../../common/component/custom_text_form_field.dart';
import '../../common/const/text_style.dart';
import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_button.dart';
import '../../common/layout/default_layout.dart';
import '../../common/model/screen_arguments.dart';
import '../../common/util/text_validator.dart';

class EmailRegisterScreen extends StatefulWidget {
  const EmailRegisterScreen({super.key});

  @override
  State<EmailRegisterScreen> createState() => _EmailRegisterScreenState();
}

class _EmailRegisterScreenState extends State<EmailRegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormState> phoneFormKey = GlobalKey();

  bool isLoading = false;

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
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '회원가입'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8.0),
                const Text(
                  '회원가입을 위해\n계정정보를 입력해 주세요.',
                  style: MyTextStyle.headTitle,
                ),
                const SizedBox(height: 40.0),
                CustomTextFormField(
                  onChanged: (String? value) {
                    setState(() {
                      emailText = value;
                    });
                  },
                  onSaved: (String? value) {
                    emailText = value;
                  },
                  validator: TextValidator.emailValidator,
                  title: '이메일',
                  hintText: '예) abc@true.com',
                  button: DefaultElevatedButton(
                    onPressed: isValidEmail ||
                            emailText == null ||
                            emailText!.isEmpty ||
                            formKey.currentState == null ||
                            !(formKey.currentState!.validate())
                        ? null
                        : () async {
                            setState(() {
                              isLoading = true;
                            });

                            await Future.delayed(Duration(seconds: 1));
                            setState(() {
                              isLoading = false;
                              isValidEmail = true;
                            });

                            showCustomToast(
                              context,
                              msg: '사용 가능한 이메일 입니다.',
                            );
                          },
                    child:
                        isValidEmail ? const Text('확인 완료') : const Text('중복확인'),
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
                        passwordText, value);
                  },
                  title: '비밀번호 확인',
                  hintText: '영문, 숫자, 특수문자 포함 8~15자',
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 16.0),
                Form(
                  key: phoneFormKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: CustomTextFormField(
                    title: '휴대폰 번호',
                    hintText: '예) 01012341234',
                    button: DefaultElevatedButton(
                      onPressed: isVerify ||
                              !(phoneFormKey.currentState != null &&
                                  phoneFormKey.currentState!.validate()) ||
                              phoneText == null ||
                              phoneText!.isEmpty
                          ? null
                          : () {
                              setState(() {
                                isRequest = true;
                              });
                              showCustomToast(context, msg: '인증 번호가 전송되었습니다.');
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
                    validator: TextValidator.phoneValidator,
                    enabled: !isVerify,
                    textInputType: TextInputType.number,
                    maxLength: 11,
                  ),
                ),
                const SizedBox(height: 4.0),
                if (isRequest && !isVerify)
                  CustomTextFormField(
                    hintText: '인증번호 입력',
                    button: SizedBox(
                      width: 150.0,
                      child: DefaultElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          await Future.delayed(Duration(seconds: 1));
                          showCustomToast(
                            context,
                            msg: '인증이 완료되었습니다.',
                          );

                          setState(() {
                            isRequest = false;
                            isVerify = true;
                            isLoading = false;
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
                    // validator: TextValidator.phoneValidator,
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
                          phoneText!.isNotEmpty &&
                          isVerify
                      ? () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            RouteNames.completion,
                            (route) => false,
                            arguments: ScreenArguments<Map<String, String>>(
                              data: {
                                'appBarTitle': '회원가입 완료',
                                'contentTitle': '회원가입이 정상적으로\n완료되었습니다.',
                                'contentDescription': '',
                              },
                            ),
                          );
                        }
                      : null,
                  child: const Text('다음'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
