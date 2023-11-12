import 'package:flutter/material.dart';

import '../component/custom_loading.dart';
import '../const/colors.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final Widget? loadingWidget;
  final PreferredSizeWidget? appbar;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;

  const DefaultLayout({
    required this.child,
    this.isLoading = false,
    this.loadingWidget,
    this.appbar,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.floatingActionButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: appbar,
          backgroundColor: backgroundColor ?? MyColor.scaffoldBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: child,
            ),
          ),
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
        ),
        Positioned.fill(
          child: Visibility(
            visible: isLoading,
            child: loadingWidget ?? const CustomLoadingScreen(),
          ),
        )
      ],
    );
  }
}
