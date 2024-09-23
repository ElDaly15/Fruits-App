import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_app_buttom.dart';
import 'package:fruits_app/featuers/auth/presentation/views/widgets/custom_forget_password.dart';
import 'package:fruits_app/core/widgets/custom_text_field.dart';
import 'package:fruits_app/featuers/auth/presentation/views/widgets/custom_or_divider.dart';
import 'package:fruits_app/featuers/auth/presentation/views/widgets/have_or_not_account_widget.dart';
import 'package:fruits_app/featuers/auth/presentation/views/widgets/login_social_items.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: CustomButtom(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'تسجيل دخول'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 28),
              child: HaveOrNotAccountWidget(
                firstText: 'لا تمتلك حساب؟ ',
                secondText: 'قم بإنشاء حساب',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: CustomOrDivider(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: LoginSocialItems(),
            ),
          ],
        ),
      ),
    );
  }
}
