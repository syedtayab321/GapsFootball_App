import 'package:flutter/material.dart';
import 'package:gaps_football_app/AdminPortal/Controllers/booking_controller.dart';
import 'package:gaps_football_app/CustomDialogBoxes/custom_confirmation_dialog.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import 'package:gaps_football_app/CustomWidgets/AppColors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../AdminPortal/Forms/update_booking_form.dart';
import '../../CustomDialogBoxes/book_now_dialogbox.dart';
import '../../CustomWidgets/ElevatedButton.dart';
import '../../UserPortal/DashboardComponents/ViewDetailsPage.dart';

class UniformBookingCard extends StatelessWidget {
  final Map<String, dynamic> service;
  final String docId;
  final String userRole;
  UniformBookingCard({super.key, required this.service, required this.docId ,required this.userRole});
  final BookingController controller = Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              'assets/images/onetoone.webp',
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
                  title: service['type'] ?? '',
                  size: 18,
                  weight: FontWeight.bold,
                  color: AppColors.lightGolden,
                ),
                const SizedBox(height: 8),
                CustomTextWidget(
                  title: 'Price: ${service['price'] ?? ''}',
                  size: 14,
                  color: Colors.black87,
                ),
                const SizedBox(height: 8),
                CustomTextWidget(
                  title: 'Available Sizes: ${service['availableSize'] ?? ''}',
                  size: 14,
                  color: Colors.black87,
                ),
                const SizedBox(height: 8),
                CustomTextWidget(
                  title:
                      'Created At: ${service['createdAt'] != null ? DateFormat('yyyy-MM-dd HH:mm').format(service['createdAt'].toDate().toLocal()) : ''}',
                  size: 12,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      text: userRole=='admin' ? 'Delete' : 'Add to Fav',
                      color: Colors.white,
                      backcolor: userRole == 'admin' ? Colors.red : AppColors.black,
                      padding: 10,
                      radius: 10,
                      width: 130,
                      height: 50,
                      path: ()async{
                        userRole == 'admin' ?
                        Get.dialog(
                            CustomConfirmationDialog(
                              title: 'Delete',
                              description: 'Are You Sure You want to Delete',
                              onCancel: () {
                                Get.back();
                              },
                              onConfirm: () async {
                                await controller.deleteService(docId);
                              },
                            )): Get.to(ViewDetailsPage());
                      },
                    ),
                    CustomElevatedButton(
                      text: userRole == 'admin' ? 'Update' : 'Book Now',
                      color: Colors.white,
                      backcolor: userRole == 'admin' ? Colors.green : Colors.amber,
                      padding: 10,
                      radius: 10,
                      width: 130,
                      height: 50,
                      path: ()async{
                        userRole == 'admin'?
                        Get.to(UpdateBookingForm(docId: docId)):
                        Get.dialog(BookNowDialog(serviceData: service,));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}