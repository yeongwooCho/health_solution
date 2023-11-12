import 'package:flutter/material.dart';

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
          controller: controller,
          children: [
            Container(child: Center(child: Text('111'))),
            Container(child: Center(child: Text('222'))),
            Container(child: Center(child: Text('333'))),
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
          Icons.show_chart,
          size: 32.0,
        ),
        label: '매출 조회',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.payments_rounded,
          size: 32.0,
        ),
        label: '정산 조회',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline_rounded,
          size: 32.0,
        ),
        label: '마이페이지',
      ),
    ];
  }

  void tabListener() {
    setState(() {});
  }
}
