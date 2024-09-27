import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_app/featuers/home/presentation/views/widgets/custom_home_view_app_bar.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SafeArea(child: SizedBox()),
        CustomHomeViewAppBar(),
      ],
    );
  }
}
