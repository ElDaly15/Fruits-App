import 'package:flutter/material.dart';
import 'package:fruits_app/featuers/onBoarding/presentation/views/widgets/custom_on_boarding_buttom.dart';
import 'package:fruits_app/featuers/onBoarding/presentation/views/widgets/page_view_of_on_boarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final controller = PageController(initialPage: 0);

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageViewOfOnBoarding(
          onPageChangedValue: (value) {
            index = value;
            setState(() {});
          },
          controller: controller,
        ),
        SmoothPageIndicator(
          controller: controller,
          count: 2,
          effect: WormEffect(
            dotWidth: 12,
            dotColor: const Color(0xff5DB957).withOpacity(0.5),
            activeDotColor: const Color(0xff1B5E37),
            dotHeight: 12,
            type: WormType.thinUnderground,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        index == 1
            ? const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: customOnBoardingButtom(),
              )
            : const SizedBox(),
      ],
    );
  }
}
