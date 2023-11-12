import 'package:flutter/material.dart';
import 'package:health_solution/common/component/show/show_cupertino_alert.dart';
import 'package:health_solution/common/const/colors.dart';
import 'package:health_solution/common/view/custom_list_screen.dart';

import '../../common/const/text_style.dart';
import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_layout.dart';

class SurveyScreen extends StatefulWidget {
  final String appBarTitle;
  final String title;
  final List<String> items;
  final void Function() onTapItem;

  const SurveyScreen({
    super.key,
    required this.appBarTitle,
    required this.title,
    required this.items,
    required this.onTapItem,
  });

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  String? selectedItem;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isLoading: isLoading,
      loadingWidget: const Center(
        child: CircularProgressIndicator(
          color: MyColor.darkGrey,
        ),
      ),
      appbar: DefaultAppBar(
        title: widget.appBarTitle,
        leading: BackButton(
          onPressed: () {
            showAlert(
              context: context,
              titleWidget: Text('설문 종료하기'),
              contentWidget: Text('현재까지 선택한 기록은 모두 삭제됩니다.'),
              completeText: '확인',
              completeFunction: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              cancelText: '취소',
              cancelFunction: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8.0),
            Text(
              widget.title,
              style: MyTextStyle.headTitle,
            ),
            const SizedBox(height: 40.0),
            CustomListScreen(
              shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                      selectedItem = widget.items[index];
                    });
                    await Future.delayed(Duration(seconds: 1));

                    setState(() {
                      widget.onTapItem();
                      isLoading = false;
                    });
                  },
                  child: _renderCustomCard(
                      title: '${index + 1})  ${widget.items[index]}',
                      isSelected: selectedItem == null
                          ? false
                          : selectedItem! == widget.items[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderCustomCard({
    required String title,
    required bool isSelected,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: isSelected ? 2.0 : 1.0,
          color: isSelected ? MyColor.primary : MyColor.middleGrey,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Text(
          title,
          style: MyTextStyle.descriptionMedium.copyWith(
            color: isSelected ? MyColor.primary : MyColor.defaultText,
          ),
        ),
      ),
    );
  }
}
