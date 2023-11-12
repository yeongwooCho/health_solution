import 'package:flutter/material.dart';

import '../../common/component/custom_container_button.dart';
import '../../common/layout/default_appbar.dart';
import '../../common/layout/default_layout.dart';
import '../component/category_content.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: "건강 카테고리"),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomContainerButton(
                      title: '일',
                      isSelected: selectedItemIndex == 0,
                      onTap: () {
                        selectedItemIndex = 0;
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: CustomContainerButton(
                      title: '주',
                      isSelected: selectedItemIndex == 1,
                      onTap: () {
                        selectedItemIndex = 1;
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: CustomContainerButton(
                      title: '월',
                      isSelected: selectedItemIndex == 2,
                      onTap: () {
                        selectedItemIndex = 2;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              if (selectedItemIndex == 0)
                CategoryContent(
                  title: '관절과 연골 건강 왜 중요할까?',
                  imagePath: 'asset/img/category_1.png',
                  description:
                      '연골은 두께가 3mm 안팎으로 한 번 손상된 연골은 재생이 불가능하기 때문에 평생 하나의 연골을 건강하게 유지해야 합니다. 연골이 손상되면 염증이 발생하고, 염증에 대한 치료를 적절하게 하지 못하면 만성 염증으로 변해 또다시 연골을 파괴하는 악순환을 반복하게 되죠. 그래서 관절에 대한 염증, 관절염은 한 번 발생하면 완치가 어려워 미리 예방하는 것이 매우 중요합니다.\n\n관절 건강이 악화되면, 단순히 관절염에서 그치지 않고 활동량이 떨어지면서 자연스레 면역력도 함께 저하됩니다. 더불어 비만이나 우울증 등을 유발할 수 있으며, 심폐 기능이 약해져 심장병의 위험을 높일 수 있습니다. 같은 이유로 고지혈증, 고혈압, 당뇨 등과 같은 대사 질환을 동반하게 되는 경우도 다반사 입니다. 이처럼 관절염은 매우 위험한 질환 중 하나로 분류되고 있습니다.',
                ),
              if (selectedItemIndex == 1)
                CategoryContent(
                  title: '피부 관리의 효과',
                  imagePath: 'asset/img/category_2.png',
                  description:
                      '피부는 외부 환경과 직접 접촉하는 신체의 가장 바깥 조직으로서 자외선을 차단하고, 세균과 독소 등 위험 요소의 침입을 방지하며, 땀의 분비로 체온을 조절하고, 몸 안의 수분을 유지하는 등 다양한 생리적 기능을 담당하는 기관입니다. 그러나 피부의 중요성은 간이나 심장과 같이 생리적 기능에만 있는 것이 아니라 건강과 아름다움을 표현하는 매개체로서의 역할도 합니다.\n\n건강한 피부를 유지하지 못하게 되면 비록 병이 없다 하더라도 외모의 변화가 일어나게 되며 이는 또 다른 스트레스를 유발한다. 피부를 젊고 건강한 상태로 유지하는 것은 각자의 심신을 즐겁게 해줄 수 있기 때문에 일반적인 건강과 동시에 정신적인 건강에 활력을 주게 된다. 그러므로 피부관리는 건강관리의 일부분이라고 할 수 있다.',
                ),
              if (selectedItemIndex == 2)
                CategoryContent(
                  title: '항산화의 중요성',
                  imagePath: 'asset/img/category_3.png',
                  description:
                      '산화를 억제한다는 것으로, 세포의 노화과정과 이를 예방하는 방법을 설명할 때 주로 등장하는 개념입니다. 즉, 세포의 노화가 세포의 산화를 의미하기 때문입니다. 사람의 호흡을 통해 체내로 들어온 산소는 인체에 필요한 에너지를 만드는 등 이로운 작용도 하지만, 이 과정에서 몸에 좋지 않은 여분의 산소인 활성산소(Free Radical)가 생성됩니다.\n\n활성화산소는 체내의 정상 세포를 공격하여 노화나 각종 질병의 원인으로 작용합니다. 따라서 이 활성산소를 제거하는 것이 세포의 산화(노화)를 막는 방법이며, 이러한 세포의 산화를 억제하는 것이 항산화입니다.\n\n발생한 활성산소는 탈모, 주름, 노화의 원인이 됩니다. 나이가 들어감에 따라 SOD(항산화 효소)가 감소함으로 항산화는 우리 신체에서 아주 중요하게 작용됩니다.',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
