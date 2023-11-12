import 'package:flutter/material.dart';

import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_layout.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(title: "건강 카테고리"),
      child: Center(
        child: Text('건강 카테고리'),
      ),
    );
  }
}
