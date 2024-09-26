import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/app_images.dart';
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
        const SizedBox(
          height: 16,
        ),
        LoginSocialItem(
          onTap: () {
            GoogleSignIn googleSignIn = GoogleSignIn();
            googleSignIn.disconnect();
            // BlocProvider.of<LoginUserCubit>(context).signInWithFacebook();
          },
          image: Assets.imagesFacebookIcon,
          text: 'تسجيل بواسطه فيسبوك',
        ),
      ],
    );
  }
}
