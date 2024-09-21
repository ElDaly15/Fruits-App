import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

// ignore: camel_case_types
class customOnBoardingButtom extends StatelessWidget {
  const customOnBoardingButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff1B5E37),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            minimumSize: const Size(double.infinity, 50)),
        child: Text(
          'ابدأ الان ',
          style: TextStyles.bold16.copyWith(
            color: Colors.white,
            fontFamily: 'Cairo',
          ),
        ),
      ),
    );
  }
}
