import 'package:flutter/material.dart';
import 'package:health_solution/common/layout/default_button.dart';
import 'package:health_solution/common/view/custom_completion_screen.dart';
import 'package:health_solution/user/view/find_email_screen.dart';

import '../../user/view/email_login_screen.dart';
import '../../user/view/email_register_screen.dart';
import '../../user/view/find_password_change_screen.dart';
import '../../user/view/find_password_screen.dart';
import '../view/root_tab.dart';

class RouteNames {
  // initial
  static const String splash = '/';

  // user
  static const String emailSignIn = '/email/sign/in';
  static const String emailSignUp = '/email/sign/up';
  static const String findEmail = '/email/find';
  static const String findPassword = '/password/find';
  static const String findPasswordChange = '/password/change';

  // root tab
  static const String root = '/root';
}

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  // // global
  // RouteNames.completion: (context) {
  //   final args =
  //       ModalRoute.of(context)?.settings.arguments as ScreenArguments<String>;
  //   return CustomCompletionScreen(
  //     title: args.data,
  //   );
  // },

  // root tab
  RouteNames.root: (_) => RootTab(),

  // user
  RouteNames.emailSignIn: (_) => EmailLoginScreen(),
  RouteNames.emailSignUp: (_) => EmailRegisterScreen(),
  RouteNames.findEmail: (_) => FindEmailScreen(),
  RouteNames.findPassword: (_) => FindPasswordScreen(),
  RouteNames.findPasswordChange: (_) => FindPasswordChangeScreen(),
};
