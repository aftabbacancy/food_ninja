import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class GlobalBg extends StatelessWidget {
  const GlobalBg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      fixedColor: CustomColors.primaryGreen,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Messages',
        ),
      ],
    );
  }
}
