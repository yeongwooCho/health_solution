import 'package:flutter/material.dart';
import '../model/screen_arguments.dart';

class RouteNames {
  // initial
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';

  // global
  static const String completion = '/completion';

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
  //
  // // root tab
  // RouteNames.root: (_) => RootTab(),

};
