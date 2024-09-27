import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class BestSellerHeader extends StatelessWidget {
  const BestSellerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'الأكثر مبيعا',
          style: TextStyles.bold16,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'المزيد',
            style:
                TextStyles.semiBold13.copyWith(color: const Color(0xff949D9E)),
          ),
        ),
      ],
    );
  }
}
