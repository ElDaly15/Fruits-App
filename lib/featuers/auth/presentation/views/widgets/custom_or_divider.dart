import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class CustomOrDivider extends StatelessWidget {
  const CustomOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            indent: 20,
            endIndent: 20,
            height: 1,
            thickness: 1,
            color: Color(0xffDDDFDF),
          ),
        ),
        Text(
          'أو',
          style: TextStyles.semiBold16.copyWith(color: Colors.black),
        ),
        const Expanded(
          child: Divider(
            endIndent: 20,
            indent: 20,
            height: 1,
            thickness: 1,
            color: Color(0xffDDDFDF),
          ),
        ),
      ],
    );
  }
}
