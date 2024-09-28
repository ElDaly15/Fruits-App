import 'package:flutter/material.dart';
import 'package:fruits_app/featuers/home/presentation/views/widgets/custom_bottom_nav_bar.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});
  static const routeName = 'homePageView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
