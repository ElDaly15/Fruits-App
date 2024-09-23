import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/featuers/auth/presentation/views/widgets/login_with_social_item.dart';

class LoginSocialItems extends StatelessWidget {
  const LoginSocialItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginSocialItem(
          onTap: () {},
          image: Assets.imagesGoogleIcon,
          text: 'تسجيل بواسطه جوجل',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: LoginSocialItem(
            onTap: () {},
            image: Assets.imagesApplIcon,
            text: 'تسجيل بواسطه أبل',
          ),
        ),
        LoginSocialItem(
          onTap: () {},
          image: Assets.imagesFacebookIcon,
          text: 'تسجيل بواسطه فيسبوك',
        ),
      ],
    );
  }
}
