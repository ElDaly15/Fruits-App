// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:fruits_app/core/helper/singleton_helper.dart';
import 'package:fruits_app/core/service/fire_base_services.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/core/widgets/custom_app_buttom.dart';
import 'package:fruits_app/core/widgets/custom_text_field.dart';

class ForgetPasswordBodyView extends StatefulWidget {
  const ForgetPasswordBodyView({super.key});

  @override
  State<ForgetPasswordBodyView> createState() => _ForgetPasswordBodyViewState();
}

class _ForgetPasswordBodyViewState extends State<ForgetPasswordBodyView> {
  final formKeyPasswordEdit = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKeyPasswordEdit,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              'لا تقلق , ما عليك سوي كتابه بريدك الالكتروني وسنرسل لك لينك لاعاده تعيين كلمه المرور',
              style: TextStyles.semiBold16
                  .copyWith(color: const Color(0xff616A6B)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: CustomTextField(
                  onChanged: (value) {
                    email = value;
                  },
                  obscureText: false,
                  isPassword: false,
                  hintText: 'البريد الالكتروني'),
            ),
            CustomButtom(
                onPressed: () async {
                  if (formKeyPasswordEdit.currentState!.validate()) {
                    await getIt<FireBaseServices>()
                        .sendPasswordResetEmail(email!, context);
                    Navigator.pop(context);
                    FocusScope.of(context).unfocus();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'نسيت كلمه المرور')
          ],
        ),
      ),
    );
  }
}
