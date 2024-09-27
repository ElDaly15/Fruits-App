import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_images.dart';

class CustomNotifactionIconWithoutAlert extends StatelessWidget {
  const CustomNotifactionIconWithoutAlert({super.key, required this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 22,
        backgroundColor: const Color(0xffEEF8ED),
        child: SvgPicture.asset(
          Assets.imagesNotification,
          width: 25,
        ),
      ),
    );
  }
}

class CustomNotifactionIconWithAlert extends StatelessWidget {
  const CustomNotifactionIconWithAlert({super.key, required this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 22,
        backgroundColor: const Color(0xffEEF8ED),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(
              Assets.imagesNotification,
              width: 25,
            ),
            const Positioned(
              bottom: 5,
              top: -10,
              right: 3,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
