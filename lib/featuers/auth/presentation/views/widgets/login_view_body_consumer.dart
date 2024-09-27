import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helper/singleton_helper.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/featuers/auth/presentation/manager/login_user_cubit/login_user_cubit.dart';
import 'package:fruits_app/featuers/auth/presentation/views/widgets/login_view_body.dart';
import 'package:fruits_app/featuers/home/presentation/views/home_page_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/widgets/custom_snack_bar.dart';

class CustomLoginViewBodyConsumer extends StatelessWidget {
  const CustomLoginViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginUserCubit, LoginUserState>(
      listener: (context, state) {
        if (state is LoginUserSuccess) {
          Navigator.pushReplacementNamed(context, HomePageView.routeName);
        }

        if (state is LoginUserFailuer) {
          getIt<CustomSnackBar>().showCustomSnackBar(
              context: context,
              message: state.message,
              type: AnimatedSnackBarType.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is LoginUserLoading ? true : false,
            color: Colors.transparent,
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            child: const LoginViewBody());
      },
    );
  }
}
