import 'package:flutter/material.dart';
import 'package:fruits_app/featuers/auth/presentation/views/widgets/forget_password_view_body.dart';
import '../../../../core/utils/app_text_styles.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const routeName = 'ForgetPasswordView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'نسيان كلمة المرور',
          style: TextStyles.bold19.copyWith(color: Colors.black),
        ),
      ),
      body: const ForgetPasswordBodyView(),
    );
  }
}
