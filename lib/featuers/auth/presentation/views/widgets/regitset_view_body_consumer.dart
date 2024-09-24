import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/featuers/auth/presentation/manager/create_user_cubit/create_user_cubit.dart';
import 'package:fruits_app/featuers/auth/presentation/views/widgets/register_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateUserCubit, CreateUserState>(
      listener: (context, state) {
        if (state is CreateUserSuccess) {
          print(state.userEntity.name);
          print(state.userEntity.email);
          print(state.userEntity.uid);
        }
        if (state is CreateUserFailuer) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            color: Colors.transparent,
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            inAsyncCall: state is CreateUserLoading ? true : false,
            child: const RegisterViewBody());
      },
    );
  }
}
