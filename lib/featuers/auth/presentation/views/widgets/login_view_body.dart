import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_forget_password.dart';
import 'package:fruits_app/core/widgets/custom_text_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: CustomTextField(
            hintText: 'البريد الالكتروني',
            obscureText: false,
            isPassword: false,
            onChanged: (value) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextField(
            hintText: 'كلمه المرور',
            obscureText: true,
            isPassword: true,
            onChanged: (value) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomForgetPasswordWidget(
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
