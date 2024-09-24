import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helper/singleton_helper.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/featuers/auth/domain/repos/auth_repo.dart';
import 'package:fruits_app/featuers/auth/presentation/manager/login_user_cubit/login_user_cubit.dart';
import 'package:fruits_app/featuers/auth/presentation/views/widgets/login_view_body_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginUserCubit(getIt<AuthRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'تسجيل دخول',
            style: TextStyles.bold19.copyWith(color: Colors.black),
          ),
        ),
        body: const CustomLoginViewBodyConsumer(),
      ),
    );
  }
}
