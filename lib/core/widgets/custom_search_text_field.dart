import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.onChanged});
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'ابحث عن ... ',
        hintStyle:
            TextStyles.semiBold16.copyWith(color: const Color(0xff949D9E)),
        prefixIcon: SizedBox(
          width: 30, // Adjust width
          height: 30, // Adjust height
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              Assets.imagesSearchIcon,
              width: 20, // Set icon width
              height: 20, // Set icon height
            ),
          ),
        ),
        suffixIcon: SizedBox(
          width: 30, // Adjust width
          height: 30, // Adjust height
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              Assets.imagesFilter,
              width: 20, // Set icon width
              height: 20, // Set icon height
            ),
          ),
        ),
        fillColor: const Color.fromARGB(193, 253, 250, 250),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      cursorColor: AppColors.primaryColor,
      style: TextStyles.semiBold16.copyWith(color: const Color(0xff0C0D0D)),
    );
  }
}
