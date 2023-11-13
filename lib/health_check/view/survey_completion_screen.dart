import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:health_solution/common/component/custom_text_form_field.dart';
import 'package:health_solution/common/const/colors.dart';
import 'package:health_solution/common/layout/default_appbar.dart';
import 'package:health_solution/common/layout/default_button.dart';
import 'package:health_solution/common/layout/default_layout.dart';

import '../../common/const/text_style.dart';

class SurveyCompletionScreen extends StatelessWidget {
  const SurveyCompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '설문 결과'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8.0),
              const Text(
                '고객님은 현재',
                style: MyTextStyle.headTitle,
              ),
              Row(
                children: [
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      child: Text(
                        '당뇨병과 심혈관',
                        style: MyTextStyle.headTitle,
                      ),
                    ),
                  ),
                  const Text(
                    '가 걱정됩니다.',
                    style: MyTextStyle.headTitle,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Container(
                color: MyColor.darkGrey,
                height: 1.0,
              ),
              const SizedBox(height: 20.0),
              const Text(
                '추천상품',
                style: MyTextStyle.bodyTitleBold,
              ),
              const SizedBox(height: 20.0),
              ShowGrid(),
              Container(
                color: MyColor.darkGrey,
                height: 1.0,
              ),
              const SizedBox(height: 40.0),
              _InputContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowGrid extends StatelessWidget {
  const ShowGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        childAspectRatio: 1 / 2, // / 1,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        final item = getItemData(index: index);
        return GestureDetector(
          onTap: () {
            print(index);
          },
          child: GridItem(
            index: index,
            category: item[0],
            brand: item[1],
            title: item[2],
            price: item[3],
          ),
        );
      },
    );
  }

  List<String> getItemData({required int index}) {
    switch (index) {
      case 0:
        return [
          '[혈행/콜레스테롤] ',
          'FILLRESEARCH',
          '나토필',
          '68,500 원',
        ];
      case 1:
        return [
          '[관절/연골] ',
          'FILLRESEARCH',
          '옵티머스트',
          '59,800 원',
        ];
      case 2:
        return [
          '[관절/연골] ',
          'FILLRESEARCH',
          '조인머스트',
          '전화상담',
        ];
      case 3:
        return [
          '[피부 관리/항산화] ',
          'INNERMARVELL',
          '클린C글루타치온',
          '38,700 원',
        ];
      case 4:
        return [
          '[피부 관리/항산화] ',
          'INNERMARVELL',
          '클린C글루타치온',
          '59,800원',
        ];
      default:
        return [
          '',
          '',
          '',
          '',
        ];
    }
  }
}

class GridItem extends StatelessWidget {
  final int index;
  final String category;
  final String brand;
  final String title;
  final String price;

  const GridItem({
    super.key,
    required this.index,
    required this.category,
    required this.brand,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'asset/img/item_${index + 1}.png',
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 16.0),
        Text(
          category,
          style: MyTextStyle.bodyRegular,
        ),
        Text(
          brand,
          style: MyTextStyle.bodyBold,
        ),
        Text(
          title,
          style: MyTextStyle.bodyRegular,
        ),
        const SizedBox(height: 16.0),
        Text(
          price,
          style: MyTextStyle.bodyBold,
        ),
      ],
    );
  }
}

class _InputContainer extends StatefulWidget {
  const _InputContainer({super.key});

  @override
  State<_InputContainer> createState() => _InputContainerState();
}

class _InputContainerState extends State<_InputContainer> {
  bool isAgreePersonal = false;
  bool isAgreeMarketing = false;
  String? phoneText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '고객님에게 더욱 알맞은 제품을 추천해 드리기 위해 아래에 연락처를 남겨주시면 서울대 약학박사 출신 전문 상담원이 고객님에게 연락을 드리도록 하겠습니다.',
          style: MyTextStyle.bodyRegular,
        ),
        const SizedBox(height: 20.0),
        CustomTextFormField(
          title: '연락처',
          hintText: "' - ' 없이 입력",
          onChanged: (String? value) {
            setState(() {
              setState(() {
                phoneText = value;
              });
            });
          },
          onSaved: (String? value) {},
          validator: (String? value) {
            return null;
          },
          textInputType: TextInputType.number,
          maxLength: 11,
        ),
        const SizedBox(height: 20.0),
        const Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Text(
            '이용약관',
            style: MyTextStyle.bodyTitleBold,
          ),
        ),
        const SizedBox(height: 12.0),
        GestureDetector(
          onTap: () {
            setState(() {
              isAgreePersonal = !isAgreePersonal;
            });
          },
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                isAgreePersonal
                    ? const Icon(
                        Icons.check_circle,
                        color: MyColor.primary,
                        size: 28.0,
                      )
                    : const Icon(
                        Icons.circle_outlined,
                        color: MyColor.middleGrey,
                        size: 28.0,
                      ),
                const SizedBox(width: 8.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.2,
                      color: MyColor.primary,
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 8.0, top: 0.0, bottom: 0.0),
                    child: Text(
                      '필수',
                      style: MyTextStyle.descriptionRegular.copyWith(
                        color: MyColor.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                const Text(
                  '개인 정보 제공 및 동의',
                  style: MyTextStyle.descriptionMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12.0),
        GestureDetector(
          onTap: () {
            setState(() {
              isAgreeMarketing = !isAgreeMarketing;
            });
          },
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                isAgreeMarketing
                    ? const Icon(
                        Icons.check_circle,
                        color: MyColor.primary,
                        size: 28.0,
                      )
                    : const Icon(
                        Icons.circle_outlined,
                        color: MyColor.middleGrey,
                        size: 28.0,
                      ),
                const SizedBox(width: 8.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.2,
                      color: MyColor.primary,
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 8.0, top: 0.0, bottom: 0.0),
                    child: Text(
                      '필수',
                      style: MyTextStyle.descriptionRegular.copyWith(
                        color: MyColor.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                const Text(
                  '마케팅 수신 메세지 동의',
                  style: MyTextStyle.descriptionMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 40.0),
        DefaultElevatedButton(
          onPressed: isAgreePersonal &&
                  isAgreeMarketing &&
                  phoneText != null &&
                  phoneText!.isNotEmpty
              ? () {}
              : null,
          child: const Text('확인'),
        ),
        // const SizedBox(height: 20.0),
        // DefaultElevatedButton(
        //   isBorderSide: true,
        //   onPressed: () {},
        //   child: const Text('홈으로 이동'),
        // ),
      ],
    );
  }
}
