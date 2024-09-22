import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/db/cached_helper.dart';
import 'package:fruits_app/core/helper/singleton_helper.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/featuers/auth/presentation/views/login_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.mainImage,
    required this.subImage,
    required this.subText,
    required this.mainTextFirst,
    required this.mainTextSecond,
    required this.mainTextLast,
    required this.indexOfPage,
  });

  final String mainImage,
      subImage,
      mainTextFirst,
      mainTextSecond,
      mainTextLast,
      subText;

  final int indexOfPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  mainImage,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  subImage,
                ),
              ),
              indexOfPage == 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 22),
                      child: SafeArea(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, LoginView.routeName);
                            getIt<CacheHelper>()
                                .saveData(key: 'onBoarding', value: true);
                          },
                          child: Text(
                            'تخط',
                            style: TextStyles.regular13.copyWith(
                                fontFamily: 'Cairo',
                                color: const Color(0xff949D9E)),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mainTextLast,
              style: TextStyles.bold23.copyWith(fontFamily: 'Cairo'),
            ),
            Text(
              mainTextFirst,
              style: TextStyles.bold23.copyWith(
                  color: const Color(0xff1B5E37), fontFamily: 'Cairo'),
            ),
            Text(
              mainTextSecond,
              style: TextStyles.bold23.copyWith(
                  color: const Color(0xffF4A91F), fontFamily: 'Cairo'),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 350,
          child: Text(
            textAlign: TextAlign.center,
            subText,
            style: TextStyles.semiBold13.copyWith(fontFamily: 'Cairo'),
          ),
        ),
      ],
    );
  }
}
