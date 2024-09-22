// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/db/cached_helper.dart';
import 'package:fruits_app/core/helper/singleton_helper.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/featuers/auth/presentation/views/login_view.dart';
import 'package:fruits_app/featuers/onBoarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      var check = getIt<CacheHelper>().getData(key: 'onBoarding') ?? false;

      if (check) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
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
