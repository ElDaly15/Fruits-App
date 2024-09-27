import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_search_text_field.dart';
import 'package:fruits_app/featuers/home/presentation/views/widgets/custom_home_view_app_bar.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SafeArea(child: SizedBox()),
        const CustomHomeViewAppBar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomSearchTextField(
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
