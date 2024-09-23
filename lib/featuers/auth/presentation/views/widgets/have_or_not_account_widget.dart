import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class HaveOrNotAccountWidget extends StatelessWidget {
  const HaveOrNotAccountWidget(
      {super.key,
      required this.firstText,
      required this.secondText,
      required this.onTap});
  final String firstText;
  final String secondText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: TextStyles.semiBold16.copyWith(color: const Color(0xff949D9E)),
        ),
        InkWell(
          onTap: onTap,
          child: Text(secondText,
              style: TextStyles.semiBold16
                  .copyWith(color: const Color(0XFF1B5E37))),
        ),
      ],
    );
  }
}
