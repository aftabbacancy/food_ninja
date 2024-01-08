import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/utils/custom_colors.dart';
import 'package:food_ninja/utils/images.dart';
import 'package:go_router/go_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _goBranch,
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: SvgPicture.asset(
              Images.home,
              width: 20,
              height: 20,
            ),
            title: const Text("Home"),
            selectedColor: CustomColors.primaryGreen,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: SvgPicture.asset(
              Images.profile,
              width: 20,
              height: 20,
            ),
            title: const Text("Profile"),
            selectedColor: CustomColors.primaryGreen,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: SvgPicture.asset(
              Images.cart,
              width: 20,
              height: 20,
            ),
            title: const Text("Cart"),
            selectedColor: CustomColors.primaryGreen,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: SvgPicture.asset(
              Images.chat,
              width: 20,
              height: 20,
            ),
            title: const Text("Chat"),
            selectedColor: CustomColors.primaryGreen,
          ),
        ],
      ),
    );
  }
}
