import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/helper/singleton_helper.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/core/widgets/back_arrow_widget.dart';
import 'package:fruits_app/featuers/auth/domain/repos/auth_repo.dart';
import 'package:fruits_app/featuers/auth/presentation/manager/create_user_cubit/create_user_cubit.dart';
import 'package:fruits_app/featuers/auth/presentation/views/widgets/regitset_view_body_consumer.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateUserCubit(getIt<AuthRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const BackArrowWidget(),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'حساب جديد',
            style: TextStyles.bold19.copyWith(color: Colors.black),
          ),
        ),
        body: const RegisterViewBodyBlocConsumer(),
      ),
    );
  }
}
