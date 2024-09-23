import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class LoginSocialItem extends StatelessWidget {
  const LoginSocialItem(
      {super.key,
      required this.text,
      required this.image,
      required this.onTap});
  final String text;
  final String image;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color.fromARGB(255, 206, 203, 203),
          )),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        leading: SvgPicture.asset(
          image,
          width: 27,
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 64),
          child: Text(text,
              style: TextStyles.semiBold16
                  .copyWith(color: const Color(0xff0C0D0D))),
        ),
      ),
    );
  }
}
