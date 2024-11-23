import 'package:flutter/material.dart';
import 'package:gaps_football_app/CustomWidgets/admin_drawer.dart';
import 'package:get/get.dart';
import '../../Controllers/HomeControllers.dart';
import '../../CustomWidgets/AppColors.dart';
import '../../CustomWidgets/TextWidget.dart';
import '../Form/add_service_form.dart';

class AdminHomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const CustomTextWidget(
          title: "Admin Dashboard",
          color: Colors.black,
          weight: FontWeight.w500,
        ),
      ),
      drawer: AdminDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
              title: "Manage Services",
              size: 18,
              color: Colors.black,
              weight: FontWeight.w500,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: controller.services.length,
                  itemBuilder: (context, index) {
                    final service = controller.services[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                            child: Image.asset(
                              service['image']!,
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(
                                  title: service['title']!,
                                  size: 18,
                                  weight: FontWeight.bold,
                                  color: AppColors.lightGolden,
                                ),
                                const SizedBox(height: 8),
                                CustomTextWidget(
                                  title: service['description']!,
                                  size: 14,
                                  color: Colors.black87,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(width: 5),
                                    CustomTextWidget(
                                      title: service['type']!,
                                      size: 14,
                                      weight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const CustomTextWidget(
                                    title: "Edit",
                                      color: Colors.white,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const CustomTextWidget(
                                    title: "Delete",
                                      color: Colors.white,
                                  ),
                                ),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: Colors.green),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    // Get.to(AdminViewDetailsPage());
                                  },
                                  child: const CustomTextWidget(
                                    title: "View Details",
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Get.to(() => const AddServiceForm());
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
