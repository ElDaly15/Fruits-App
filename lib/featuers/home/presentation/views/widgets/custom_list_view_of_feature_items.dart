import 'package:flutter/material.dart';
import 'package:fruits_app/featuers/home/presentation/views/widgets/feature_item.dart';

class CustomListViewOfFeatureItems extends StatelessWidget {
  const CustomListViewOfFeatureItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: FeatureItem(),
            );
          }),
    );
  }
}
