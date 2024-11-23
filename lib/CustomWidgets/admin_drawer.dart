import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaps_football_app/CommonScreens/welcome.dart';
import 'package:get/get.dart';
import '../CustomDialogBoxes/logout_dialog.dart';
import 'AppColors.dart';
import 'TextWidget.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.lightGolden,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              color: Colors.amber,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/group.png"),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CustomTextWidget(
                        title: "Admin Name",
                        color: Colors.white,
                        size: 18,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(height: 5),
                      CustomTextWidget(
                        title: "admin@example.com",
                        color: Colors.white70,
                        size: 14,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildDrawerItem(
                  icon: FontAwesomeIcons.gauge,
                  title: "Dashboard",
                  onTap: () {
                    Get.back();
                  },
                ),
                _buildDrawerItem(
                  icon: FontAwesomeIcons.user,
                  title: "Manage Users",
                  onTap: () {},
                ),
                _buildDrawerItem(
                  icon: FontAwesomeIcons.usersGear,
                  title: "Manage Orders",
                  onTap: () {},
                ),
                _buildDrawerItem(
                  icon: FontAwesomeIcons.chartBar,
                  title: "Messages",
                  onTap: () {},
                ),
                _buildDrawerItem(
                  icon: FontAwesomeIcons.rightFromBracket,
                  title: "Logout",
                  onTap: () {
                    Get.to(LogoutDialog(
                      onYesPressed: () {
                        Get.to(WelcomeScreen());
                      },
                      onNoPressed: () {
                        Get.back();
                      },
                    ));
                  },
                  iconColor: Colors.red,
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white70, thickness: 1),
          // Footer Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: CustomTextWidget(
              title: "Version 1.0.0",
              color: Colors.white70,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = Colors.white,
  }) {
    return ListTile(
      leading: FaIcon(
        icon,
        color: iconColor,
        size: 20,
      ),
      title: CustomTextWidget(
        title: title,
        color: Colors.white,
        size: 16,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      horizontalTitleGap: 16,
    );
  }
}
