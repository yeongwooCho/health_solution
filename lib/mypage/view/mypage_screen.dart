import 'package:flutter/material.dart';

import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_layout.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(title: "내 정보"),
      child: Center(
        child: Text('내 정보'),
      ),
    );
  }
}
