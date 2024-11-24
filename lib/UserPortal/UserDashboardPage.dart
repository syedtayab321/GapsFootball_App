import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaps_football_app/CustomWidgets/AppColors.dart';
import 'package:get/get.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import '../Controllers/bottom_bar_controllers.dart';
class UserDashboardPage extends StatelessWidget {
  final UserBottomBarController _controller = Get.put(UserBottomBarController());
  UserDashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx(() {
        return _controller.pages[_controller.selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return FloatingNavbar(
          onTap: (int val) {
            _controller.onItemTapped(val);
          },
          currentIndex: _controller.selectedIndex.value,
          iconSize: 20,
          fontSize: 10.1,
          margin: const EdgeInsets.symmetric(horizontal: 0),
          padding: const EdgeInsets.only(bottom: 8,top: 6),
          backgroundColor: AppColors.lightGolden,
          selectedItemColor: Colors.black,
          selectedBackgroundColor: Colors.white,
          unselectedItemColor: Colors.black87,
          items: [
            FloatingNavbarItem(icon: FontAwesomeIcons.house, title: 'Home'),
            FloatingNavbarItem(icon: FontAwesomeIcons.cartShopping, title: 'Orders'),
            FloatingNavbarItem(icon: FontAwesomeIcons.message, title: 'Message'),
            FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
          ],
        );
      }),
    );
  }
}