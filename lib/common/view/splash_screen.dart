import 'package:flutter/material.dart';

import '../layout/default_layout.dart';
import '../variable/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    delay();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: Image.asset("asset/logo/logo.png"),
          ),
        ],
      ),
    );
  }

  void delay() async {
    await Future.delayed(const Duration(seconds: 1));

    // Navigator.of(context).pushNamed(
    //   RouteNames.emailSignIn,
    // );
  }
}
