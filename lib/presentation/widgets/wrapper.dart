import 'package:coffee_app/app/theme/app_collors.dart';
import 'package:coffee_app/presentation/pages/delivery_screen.dart';
import 'package:coffee_app/presentation/pages/details_screen.dart';
import 'package:coffee_app/presentation/pages/home_screen.dart';
import 'package:coffee_app/presentation/pages/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentIndex = 0;
  final _screens = [
    const HomeScreen(),
    const DetailsScreen(),
    const OrderScreen(),
    const DeliveryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.transparent,
            )
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.colorFoundationBrownNormal,
          unselectedItemColor: AppColors.colorFoundationGreyLighter,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            _buildNavItem(
              icon: IconlyLight.home,
              activeIcon: IconlyBold.home,
            ),
            _buildNavItem(
              icon: IconlyLight.heart,
              activeIcon: IconlyBold.heart,
            ),
            _buildNavItem(
              icon: IconlyLight.bag,
              activeIcon: IconlyBold.bag,
            ),
            _buildNavItem(
              icon: IconlyLight.notification,
              activeIcon: IconlyBold.notification,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Icon(icon, size: 24),
            const SizedBox(height: 4),
          ],
        ),
      ),
      activeIcon: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Icon(activeIcon, size: 24),
            const SizedBox(height: 4),
            Container(
              height: 5,
              width: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: AppColors.colorFoundationBrownNormal,
              ),
            ),
          ],
        ),
      ),
      label: '',
    );
  }
}
