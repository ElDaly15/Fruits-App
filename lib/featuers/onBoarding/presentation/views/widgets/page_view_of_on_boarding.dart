import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/featuers/onBoarding/presentation/views/widgets/page_view_item.dart';

class PageViewOfOnBoarding extends StatelessWidget {
  const PageViewOfOnBoarding(
      {super.key, required this.controller, required this.onPageChangedValue});
  final PageController controller;
  final Function(int value) onPageChangedValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        onPageChanged: (value) {
          onPageChangedValue(value);
        },
        controller: controller,
        children: const [
          PageViewItem(
            mainImage: Assets.imagesPageViewItem1BackgroundImage,
            subImage: Assets.imagesPageViewItem1Image,
            subText:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية',
            mainTextFirst: 'Fruit',
            mainTextSecond: 'HUB',
            mainTextLast: ' مرحبا بك في ',
            indexOfPage: 0,
          ),
          PageViewItem(
            mainImage: Assets.imagesPageViewItem2BackgroundImage,
            subImage: Assets.imagesPageViewItem2Image,
            subText:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            mainTextFirst: '',
            mainTextSecond: '',
            mainTextLast: 'ابحث وتسوق',
            indexOfPage: 1,
          ),
          // PageViewItem(),
        ],
      ),
    );
  }
}
