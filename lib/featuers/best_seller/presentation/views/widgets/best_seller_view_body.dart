import 'package:flutter/material.dart';
import 'package:fruits_app/featuers/best_seller/presentation/views/widgets/best_seller_view_body_header.dart';
import 'package:fruits_app/featuers/home/presentation/views/widgets/best_seller_grid_view.dart';

class BestSellerViewBody extends StatelessWidget {
  const BestSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: BestSellerViewBodyHeader(),
        )),
        SliverPadding(
          sliver: BestSellerGridView(),
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
      ],
    );
  }
}
