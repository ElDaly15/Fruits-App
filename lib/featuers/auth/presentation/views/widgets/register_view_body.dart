import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/widgets/custom_app_buttom.dart';
import 'package:fruits_app/core/widgets/custom_text_field.dart';
import 'package:fruits_app/featuers/auth/presentation/manager/create_user_cubit/create_user_cubit.dart';
import 'package:fruits_app/featuers/auth/presentation/views/widgets/have_or_not_account_widget.dart';
import 'package:fruits_app/featuers/auth/presentation/views/widgets/privacy_check.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final formKey = GlobalKey<FormState>();
  String? email, password, name;
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
              padding: const EdgeInsets.only(right: 16, left: 16, top: 22),
              child: CustomTextField(
                hintText: 'الأسم كامل',
                obscureText: false,
                isPassword: false,
                onChanged: (value) {
                  name = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: CustomTextField(
                hintText: 'البريد الالكتروني',
                obscureText: false,
                isPassword: false,
                onChanged: (value) {
                  email = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                hintText: 'كلمه المرور',
                obscureText: true,
                isPassword: true,
                onChanged: (value) {
                  password = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: PrivacyCheck(
                onTap: () {},
                onValueChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: CustomButtom(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await BlocProvider.of<CreateUserCubit>(context)
                          .createUserWithEmailAndPassword(
                              email!, password!, name!);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'إنشاء حساب جديد'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: HaveOrNotAccountWidget(
                onTap: () {
                  Navigator.pop(context);
                },
                firstText: 'تمتلك حساب بالفعل؟ ',
                secondText: 'تسجيل دخول',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
