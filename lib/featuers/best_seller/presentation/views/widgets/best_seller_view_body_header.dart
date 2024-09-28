import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class BestSellerViewBodyHeader extends StatelessWidget {
  const BestSellerViewBodyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('الاكثر مبيعا', style: TextStyles.bold16);
  }
}
