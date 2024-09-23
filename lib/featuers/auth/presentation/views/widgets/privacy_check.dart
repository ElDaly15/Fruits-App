import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/core/widgets/custom_check_box.dart';

class PrivacyCheck extends StatefulWidget {
  const PrivacyCheck(
      {super.key, required this.onValueChanged, required this.onTap});
  final Function(bool?) onValueChanged;
  final Function()? onTap;
  @override
  State<PrivacyCheck> createState() => _CheckBoxForPrivacyState();
}

class _CheckBoxForPrivacyState extends State<PrivacyCheck> {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-2, 0),
      child: Row(
        children: [
          CustomCheckBox(
            onValueChangedForRow: (value) {
              setState(() {
                widget.onValueChanged(value);
              });
            },
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - (16 * 2) - 24,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'من خلال إنشاء حساب , فإنك توافق علي ',
                    style: TextStyles.semiBold13.copyWith(
                        color: const Color(0xff949D9E), fontFamily: 'Cairo'),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = widget.onTap,
                    text: 'الشروط والاحكام الخاصه بنا ',
                    style: TextStyles.semiBold13.copyWith(
                        color: AppColors.primaryColor, fontFamily: 'Cairo'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
