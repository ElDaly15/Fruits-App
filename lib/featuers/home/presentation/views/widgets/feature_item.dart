import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 390,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              width: 30,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  scale: 2.5,
                  Assets.imagesFruits,
                ),
              ),
            ),
          ),
        ),
        SvgPicture.asset(
          Assets.imagesFeaturedItemBackground,
          height: 195,
        ),
        Positioned(
          right: 35,
          bottom: 25,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'عروض العيد',
                  style: TextStyles.regular13.copyWith(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'خــصم 25 %',
                  style: TextStyles.bold19.copyWith(color: Colors.white),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(25, 35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Colors.white),
                  onPressed: () {},
                  child: Text('تسوق الان',
                      style: TextStyles.bold16
                          .copyWith(color: AppColors.primaryColor))),
            ],
          ),
        ),
      ],
    );
  }
}
