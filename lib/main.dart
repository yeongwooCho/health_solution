import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'common/variable/routes.dart';
import 'common/view/splash_screen.dart';
import 'health_check/view/survey_completion_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
      ),
      onGenerateRoute: (RouteSettings settings) {
        log('current settings: $settings');
        return MaterialPageRoute(
          builder: routes[settings.name!]!,
          settings: settings,
        );
      },
      builder: (context, child) {
        // 휴대폰 글자 크기 제한
        double myTextScaleFacto = 1.1;

        if (MediaQuery.of(context).textScaleFactor >= 1.4) {
          myTextScaleFacto = 1.4;
        }

        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: myTextScaleFacto,
          ),
          child: child!,
          // child: child,
        );
      },
      home: const SplashScreen(),
    );
  }
}
