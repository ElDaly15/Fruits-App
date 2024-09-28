import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class FruitsItem extends StatelessWidget {
  const FruitsItem({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width to adjust widget sizes accordingly
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffF3F5F7)),
      child: Stack(
        children: [
          // Favorite Icon Button in the top-right corner
          Positioned(
            right: 8,
            top: 8,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ),
          // Fruit Image and Texts
          Positioned.fill(
              child: Column(
            children: [
              SizedBox(height: screenWidth * 0.07), // Adjusted height
              Image.asset(
                Assets.imagesWatermelonTest,
                height: screenWidth * 0.25, // Make the image size relative
              ),
              SizedBox(height: screenWidth * 0.05),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'بطيخ',
                    style: TextStyles.semiBold16.copyWith(
                      fontSize: screenWidth * 0.04, // Adjust font size
                    ),
                  ),
                ),
                subtitle: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '20 جنيه / الكيلو',
                    style: TextStyles.bold16.copyWith(
                      color: const Color(0xffF4A91F),
                      fontSize: screenWidth * 0.035, // Adjust font size
                    ),
                  ),
                ),
                trailing: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
