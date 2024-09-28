import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/fruits_item.dart';

class BestSellerGridView extends StatelessWidget {
  const BestSellerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            screenWidth < 600 ? 2 : 3, // Adjust the number of columns
        childAspectRatio: screenWidth < 600
            ? 163 / 214
            : 163 / 190, // Adjust aspect ratio for smaller/larger screens
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return const FruitsItem();
      },
    );
  }
}
