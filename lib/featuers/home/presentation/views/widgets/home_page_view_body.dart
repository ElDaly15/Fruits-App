import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_search_text_field.dart';
import 'package:fruits_app/featuers/home/presentation/views/widgets/best_seller_grid_view.dart';
import 'package:fruits_app/featuers/home/presentation/views/widgets/best_seller_header.dart';
import 'package:fruits_app/featuers/home/presentation/views/widgets/custom_home_view_app_bar.dart';
import 'package:fruits_app/featuers/home/presentation/views/widgets/custom_list_view_of_feature_items.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SafeArea(child: SizedBox())),
        const SliverToBoxAdapter(child: CustomHomeViewAppBar()),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomSearchTextField(
              onChanged: (value) {},
            ),
          ),
        ),
        const SliverToBoxAdapter(child: CustomListViewOfFeatureItems()),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: BestSellerHeader(),
          ),
        ),
        const SliverPadding(
          sliver: BestSellerGridView(),
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ],
    );
  }
}
