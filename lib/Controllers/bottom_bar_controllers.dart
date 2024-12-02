import 'package:flutter/material.dart';
import 'package:gaps_football_app/AdminPortal/DashboardPages/admin_home_screen.dart';
import 'package:gaps_football_app/AdminPortal/DashboardPages/admin_profile.dart';
import 'package:gaps_football_app/AdminPortal/DashboardPages/order_requests_screen.dart';
import 'package:gaps_football_app/Messages/ChatListPage.dart';
import 'package:gaps_football_app/UserPortal/DashboardComponents/HomeScreen.dart';
import 'package:gaps_football_app/UserPortal/DashboardComponents/OwnOrdersPage.dart';
import 'package:gaps_football_app/UserPortal/DashboardComponents/userProfilePage.dart';
import 'package:get/get.dart';

class UserBottomBarController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
      HomeScreen(),
      OrdersPage(),
      OrdersPage(),
      UserSettingsPage(),
  ];
}

class AdminBottomBarController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    AdminHomeScreen(),
    OrderRequestScreen(),
    AdminChatList(),
    AdminProfile(),
  ];
}