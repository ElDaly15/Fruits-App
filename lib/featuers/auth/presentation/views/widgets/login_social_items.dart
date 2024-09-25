import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helper/singleton_helper.dart';
import 'package:fruits_app/core/service/fire_base_services.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/featuers/auth/domain/repos/auth_repo.dart';
import 'package:fruits_app/featuers/auth/presentation/manager/login_user_cubit/login_user_cubit.dart';
import 'package:fruits_app/featuers/auth/presentation/views/widgets/login_with_social_item.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginSocialItems extends StatelessWidget {
  const LoginSocialItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginSocialItem(
          onTap: () async {
            await BlocProvider.of<LoginUserCubit>(context).signInWithGoogle();
          },
          image: Assets.imagesGoogleIcon,
          text: 'تسجيل بواسطه جوجل',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: LoginSocialItem(
            onTap: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
            },
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
