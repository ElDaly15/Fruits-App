import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/core/widgets/custom_check_box.dart';

class PrivacyCheck extends StatefulWidget {
  const PrivacyCheck({super.key, required this.onValueChanged});
  final Function(bool?) onValueChanged;
  @override
  State<PrivacyCheck> createState() => _CheckBoxForPrivacyState();
}

class _CheckBoxForPrivacyState extends State<PrivacyCheck> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onValueChangedForRow: (value) {
            setState(() {
              widget.onValueChanged(value);
            });
          },
        ),
        Text('من خلال إنشاء حساب فإنك توافق علي ',
            style:
                TextStyles.semiBold13.copyWith(color: const Color(0xff949D9E))),
        InkWell(
          onTap: () {},
          child: Text(
            'الشروط والاحكام الخاصه بنا ',
            style:
                TextStyles.semiBold13.copyWith(color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
