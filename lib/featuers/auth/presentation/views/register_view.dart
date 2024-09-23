import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/core/widgets/back_arrow_widget.dart';
import 'package:fruits_app/featuers/auth/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const RegisterViewBody(),
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
    );
  }
}
