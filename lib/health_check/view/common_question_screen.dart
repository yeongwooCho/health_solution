import 'package:flutter/material.dart';
import 'package:health_solution/common/component/custom_text_form_field.dart';
import 'package:health_solution/common/const/colors.dart';
import 'package:health_solution/common/const/text_style.dart';
import 'package:health_solution/common/layout/default_button.dart';

import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/model/screen_arguments.dart';
import '../../common/variable/routes.dart';

class CommonQuestionScreen extends StatefulWidget {
  const CommonQuestionScreen({super.key});

  @override
  State<CommonQuestionScreen> createState() => _CommonQuestionScreenState();
}

class _CommonQuestionScreenState extends State<CommonQuestionScreen> {
  bool isLoading = false;
  String? name;
  String? age;
  String? height;
  String? weight;
  List<String> ache = [];

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: "공통 질문"),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8.0),
              CustomTextFormField(
                title: '당신의 이름은 무엇인가요?',
                onChanged: (String? value) {
                  setState(() {
                    name = value;
                  });
                },
                onSaved: (String? value) {},
                validator: (String? value) {
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.only(left: 4.0, bottom: 4.0),
                child: Text(
                  "성별을 알려주세요",
                  style: MyTextStyle.bodyTitleBold,
                ),
              ),
              const GenderContainer(),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                title: '나이를 알려주세요',
                onChanged: (String? value) {
                  setState(() {
                    age = value;
                  });
                },
                onSaved: (String? value) {},
                validator: (String? value) {
                  return null;
                },
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                title: '키를 알려주세요(cm)',
                onChanged: (String? value) {
                  setState(() {
                    height = value;
                  });
                },
                onSaved: (String? value) {},
                validator: (String? value) {
                  return null;
                },
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                title: '몸무게를 알려주세요(kg)',
                onChanged: (String? value) {
                  setState(() {
                    weight = value;
                  });
                },
                onSaved: (String? value) {},
                validator: (String? value) {
                  return null;
                },
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.only(left: 4.0, bottom: 4.0),
                child: Text(
                  '평소에 불편한 부위를 선택해 주세요',
                  style: MyTextStyle.bodyTitleBold,
                ),
              ),
              const _SelectableContainer(),
              const SizedBox(height: 40.0),
              DefaultElevatedButton(
                onPressed: name == null ||
                    age == null ||
                    height == null ||
                    weight == null ||
                    name!.isEmpty ||
                    age!.isEmpty ||
                    height!.isEmpty ||
                    weight!.isEmpty
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          isLoading = true;
                        });

                        await Future.delayed(const Duration(milliseconds: 500));

                        setState(() {
                          isLoading = false;
                        });
                        Navigator.of(context).pushNamed(
                          RouteNames.surveyController,
                          arguments: ScreenArguments<int>(data: 0),
                        );
                      },
                child: const Text('다음'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderContainer extends StatefulWidget {
  const GenderContainer({super.key});

  @override
  State<GenderContainer> createState() => _GenderContainerState();
}

class _GenderContainerState extends State<GenderContainer> {
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isMale = true;
              });
            },
            child: _renderItem(
              title: '남성',
              isSelected: isMale,
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isMale = false;
              });
            },
            child: _renderItem(
              title: '여성',
              isSelected: !isMale,
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderItem({
    required String title,
    required bool? isSelected,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: isSelected == null
              ? 1.0
              : isSelected
                  ? 2.0
                  : 1.0,
          color: isSelected == null
              ? MyColor.middleGrey
              : isSelected
                  ? MyColor.primary
                  : MyColor.middleGrey,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: MyTextStyle.descriptionMedium.copyWith(
            color: isSelected == null
                ? MyColor.defaultText
                : isSelected
                    ? MyColor.primary
                    : MyColor.defaultText,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _SelectableContainer extends StatefulWidget {
  const _SelectableContainer({super.key});

  @override
  State<_SelectableContainer> createState() => _SelectableContainerState();
}

class _SelectableContainerState extends State<_SelectableContainer> {
  List<String> items = ['혈관', '소화', '피부', '눈', '두뇌', '간', '관절', '면역', '두피'];
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: MyColor.darkGrey,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            childAspectRatio: 3 / 1,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) => Card(
            elevation: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (selectedItems.contains(items[index])) {
                    selectedItems.remove(items[index]);
                  } else {
                    selectedItems.add(items[index]);
                  }
                });
              },
              child: _renderItem(
                title: items[index],
                isSelected: selectedItems.contains(items[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderItem({
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
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: MyTextStyle.descriptionMedium.copyWith(
            color: isSelected ? MyColor.primary : MyColor.defaultText,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
