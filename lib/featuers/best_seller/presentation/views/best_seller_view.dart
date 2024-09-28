import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/core/widgets/custom_notification_items.dart';
import 'package:fruits_app/featuers/best_seller/presentation/views/widgets/best_seller_view_body.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key});
  static const routeName = 'bestSellerView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CustomNotifactionIconWithAlert(onTap: () {}),
          ),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'الاكثر مبيعا',
          style: TextStyles.bold19.copyWith(color: Colors.black),
        ),
      ),
      body: const BestSellerViewBody(),
    );
  }
}
