import 'package:flutter/material.dart';
import 'package:health_solution/category/view/health_screen.dart';
import 'package:health_solution/health_check/view/survey_on_boarding_screen.dart';
import 'package:health_solution/mypage/view/mypage_screen.dart';

import '../const/colors.dart';
import '../layout/default_layout.dart';

class RootTab extends StatefulWidget {
  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with TickerProviderStateMixin {
  late TabController controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: getItems().length, vsync: this);
    controller.index = 1;
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isLoading: isLoading,
      bottomNavigationBar: SizedBox(
        child: renderBottomNavigationBar(),
      ),
      child: Center(
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            HealthScreen(),
            SurveyOnBoardingScreen(),
            MyPageScreen(),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar renderBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 1.0,
      backgroundColor: MyColor.scaffoldBackground,
      selectedItemColor: MyColor.defaultText,
      selectedFontSize: 12.0,
      unselectedItemColor: MyColor.middleGrey,
      unselectedFontSize: 12.0,
      onTap: (int index) {
        controller.animateTo(index);
      },
      items: getItems(),
      currentIndex: controller.index,
    );
  }

  List<BottomNavigationBarItem> getItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.health_and_safety_outlined,
          size: 32.0,
        ),
        label: '건강',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.monitor_heart_outlined,
          size: 32.0,
        ),
        label: '내 건강 체크',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline_rounded,
          size: 32.0,
        ),
        label: '내 정보',
      ),
    ];
  }

  void tabListener() {
    setState(() {});
  }
}
