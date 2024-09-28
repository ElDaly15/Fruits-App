import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/featuers/home/presentation/views/widgets/home_page_view_body.dart';
import 'package:fruits_app/featuers/home/presentation/views/widgets/selected_icon.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
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
        children: const [
          HomePageViewBody(),
          Center(child: Text('المنتجات Page')),
          Center(child: Text('سلة التسوق Page')),
          Center(child: Text('حسابي Page')),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: 375,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -2),
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(22), topLeft: Radius.circular(22)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 22,
            ),
            _buildAnimatedItem(
              isSelected: currentIndex == 0,
              title: 'الرئيسيه',
              selectedIcon: Assets.imagesVuesaxBoldHome,
              unselectedIcon: Assets.imagesVuesaxOutlineHome,
              onTap: () {
                _onTapNavigationItem(0);
              },
            ),
            const Spacer(),
            _buildAnimatedItem(
              isSelected: currentIndex == 1,
              title: 'المنتجات',
              selectedIcon: Assets.imagesVuesaxBoldProducts,
              unselectedIcon: Assets.imagesVuesaxOutlineProducts,
              onTap: () {
                _onTapNavigationItem(1);
              },
            ),
            const Spacer(),
            _buildAnimatedItem(
              isSelected: currentIndex == 2,
              title: 'سلة التسوق',
              selectedIcon: Assets.imagesVuesaxBoldShoppingCart,
              unselectedIcon: Assets.imagesVuesaxOutlineShoppingCart,
              onTap: () {
                _onTapNavigationItem(2);
              },
            ),
            const Spacer(),
            _buildAnimatedItem(
              isSelected: currentIndex == 3,
              title: 'حسابي',
              selectedIcon: Assets.imagesVuesaxBoldUser,
              unselectedIcon: Assets.imagesVuesaxOutlineUser,
              onTap: () {
                _onTapNavigationItem(3);
              },
            ),
            const SizedBox(
              width: 22,
            ),
          ],
        ),
      ),
    );
  }

  void _onTapNavigationItem(int index) {
    setState(() {
      currentIndex = index;
    });
    _pageController.jumpToPage(index); // Jump directly to the selected page
  }

  Widget _buildAnimatedItem({
    required bool isSelected,
    required String title,
    required String selectedIcon,
    required String unselectedIcon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: isSelected
                ? SelectedIcon(
                    key: const ValueKey('selected'),
                    title: title,
                    image: selectedIcon,
                  )
                : SvgPicture.asset(
                    unselectedIcon,
                    key: const ValueKey('unselected'),
                    width: 25,
                  ),
          ),
        ],
      ),
    );
  }
}
