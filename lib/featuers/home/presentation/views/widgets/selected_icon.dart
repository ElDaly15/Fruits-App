import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class SelectedIcon extends StatelessWidget {
  const SelectedIcon({super.key, required this.title, required this.image});
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          color: Color(0xffEEEEEE)),
      child: Row(children: [
        CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          child: SvgPicture.asset(
            image,
            width: 22,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Text(title,
              style: TextStyles.bold13.copyWith(color: AppColors.primaryColor)),
        ),
      ]),
    );
  }
}
