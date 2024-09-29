import 'package:flutter/material.dart';
import 'package:fruits_app/core/helper/singleton_helper.dart';
import 'package:fruits_app/core/service/fire_base_services.dart';
import 'package:fruits_app/featuers/auth/presentation/views/login_view.dart';
import 'package:fruits_app/featuers/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:fruits_app/featuers/home/presentation/views/widgets/home_page_view_body.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});
  static const routeName = 'homePageView';

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          const HomePageViewBody(),
          const Center(child: Text('المنتجات Page')),
          const Center(child: Text('سلة التسوق Page')),
          Center(
              child: IconButton(
                  onPressed: () {
                    getIt<FireBaseServices>().signOut();

                    Navigator.pushReplacementNamed(
                        context, LoginView.routeName);
                  },
                  icon: const Icon(Icons.settings))),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          _pageController.jumpToPage(index); // Jump to the selected page
        },
      ),
    );
  }
}
