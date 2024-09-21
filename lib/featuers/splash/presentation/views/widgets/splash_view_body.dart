import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(Assets.imagesPlant),
        const Spacer(),
        Center(child: SvgPicture.asset(Assets.imagesLogo)),
        const Spacer(),
        Expanded(
          child: Center(
              child: SvgPicture.asset(
            Assets.imagesSplashBottom,
            width: double.infinity,
          )),
        ),
      ],
    );
  }
}
