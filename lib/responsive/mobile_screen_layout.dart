import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/global_variable.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  _navBar({required Icon icon, required String label}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
      backgroundColor: kPrimaryColor,
    );
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: kMobileBackgroundColor,
        items: [
          _navBar(
              icon: Icon(Icons.home,
                  color: _page == 0 ? kPrimaryColor : kSecondaryColor),
              label: ''),
          _navBar(
              icon: Icon(Icons.search,
                  color: _page == 1 ? kPrimaryColor : kSecondaryColor),
              label: ''),
          _navBar(
              icon: Icon(Icons.add_circle,
                  color: _page == 2 ? kPrimaryColor : kSecondaryColor),
              label: ''),
          _navBar(
              icon: Icon(Icons.favorite,
                  color: _page == 3 ? kPrimaryColor : kSecondaryColor),
              label: ''),
          _navBar(
              icon: Icon(Icons.person,
                  color: _page == 4 ? kPrimaryColor : kSecondaryColor),
              label: ''),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
