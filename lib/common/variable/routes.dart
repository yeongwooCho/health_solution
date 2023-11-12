import 'package:flutter/material.dart';
import 'package:health_solution/common/view/custom_completion_screen.dart';
import 'package:health_solution/health_check/view/common_question_screen.dart';
import 'package:health_solution/health_check/view/survey_completion_screen.dart';
import 'package:health_solution/health_check/view/survey_controller_screen.dart';
import 'package:health_solution/user/view/find_email_screen.dart';

import '../../user/view/email_login_screen.dart';
import '../../user/view/email_register_screen.dart';
import '../../user/view/find_password_change_screen.dart';
import '../../user/view/find_password_screen.dart';
import '../model/screen_arguments.dart';
import '../view/root_tab.dart';

class RouteNames {
  // initial
  static const String splash = '/';

  // global
  static const String completion = '/completion';

  // user
  static const String emailSignIn = '/email/sign/in';
  static const String emailSignUp = '/email/sign/up';
  static const String findEmail = '/email/find';
  static const String findPassword = '/password/find';
  static const String findPasswordChange = '/password/change';

  // root tab
  static const String root = '/root';

  // survey
  static const String commonQuestion = '/common/question';
  static const String surveyController = '/survey/controller';
  static const String surveyCompletion = '/survey/completion';
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

  // global
  RouteNames.completion: (context) {
    final args = ModalRoute.of(context)?.settings.arguments
        as ScreenArguments<Map<String, String>>;
    final data = args.data;

    return CustomCompletionScreen(
      appBarTitle: data['appBarTitle'],
      contentTitle: data['contentTitle'] ?? '',
      contentDescription: data['contentDescription'],
    );
  },

  // root tab
  RouteNames.root: (_) => RootTab(),

  // user
  RouteNames.emailSignIn: (_) => EmailLoginScreen(),
  RouteNames.emailSignUp: (_) => EmailRegisterScreen(),
  RouteNames.findEmail: (_) => FindEmailScreen(),
  RouteNames.findPassword: (_) => FindPasswordScreen(),
  RouteNames.findPasswordChange: (_) => FindPasswordChangeScreen(),

  // survey
  RouteNames.commonQuestion: (_) => CommonQuestionScreen(),
  // RouteNames.survey: (context) {
  //   final args = ModalRoute.of(context)?.settings.arguments
  //   as ScreenArguments<Map<String, dynamic>>;
  //   final data = args.data;
  //
  //   return SurveyScreen(
  //     appBarTitle: data['appBarTitle'] ?? '',
  //     title: data['title'] ?? '',
  //     items: data['items'] ?? [],
  //   );
  // },
  RouteNames.surveyController: (context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as ScreenArguments<int>;

    return SurveyControllerScreen(index: args.data);
  },
  RouteNames.surveyCompletion: (_) => SurveyCompletionScreen(),
};
