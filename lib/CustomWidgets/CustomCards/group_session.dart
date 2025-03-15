import 'package:flutter/material.dart';
import 'package:gaps_football_app/AdminPortal/Forms/update_booking_form.dart';
import 'package:gaps_football_app/CustomDialogBoxes/book_now_dialogbox.dart';
import 'package:gaps_football_app/CustomWidgets/ElevatedButton.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import 'package:gaps_football_app/CustomWidgets/AppColors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../AdminPortal/Controllers/booking_controller.dart';
import '../../CustomDialogBoxes/custom_confirmation_dialog.dart';

class GroupSessionCard extends StatelessWidget {
  final Map<String, dynamic> service;
  final String docId;
  final String userRole;
  GroupSessionCard({super.key, required this.service, required this.docId,required this.userRole});
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
                  title: 'Location: ${service['location'] ?? ''}',
                  size: 14,
                  color: Colors.black87,
                ),
                const SizedBox(height: 8),
                CustomTextWidget(
                  title: 'Age Group: ${service['ageGroup'] ?? ''}',
                  size: 14,
                  color: Colors.black87,
                ),
                const SizedBox(height: 8),
                CustomTextWidget(
                  title: 'Selected Days: ${service['selectedDay']?? ''}',
                  size: 14,
                  color: Colors.black87,
                ),
                const SizedBox(height: 8),
                CustomTextWidget(
                  title: 'Selected Time: ${service['selectedTimeSlot']?? ''}',
                  size: 14,
                  color: Colors.black87,
                ),
                const SizedBox(height: 8),
                CustomTextWidget(
                  title: 'Created At: ${service['createdAt'] != null
                      ? DateFormat('yyyy-MM-dd HH:mm').format(service['createdAt'].toDate().toLocal())
                      : ''}',
                  size: 12,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                userRole == 'admin' ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      text: 'Delete',
                      color: Colors.white,
                      backcolor: Colors.red,
                      padding: 10,
                      radius: 10,
                      width: 130,
                      height: 50,
                      path: ()async{
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
                            ));
                      },
                    ),
                    CustomElevatedButton(
                      text: 'Update',
                      color: Colors.white,
                      backcolor:Colors.green,
                      padding: 10,
                      radius: 10,
                      width: 130,
                      height: 50,
                      path: ()async{
                        Get.to(UpdateBookingForm(docId: docId));
                      },
                    ),
                  ],
                ):
                CustomElevatedButton(
                  text: 'Book Now',
                  color: Colors.white,
                  backcolor: Colors.amber,
                  padding: 10,
                  radius: 10,
                  width:Get.width,
                  height: 50,
                  path: ()async{
                    Get.dialog(BookNowDialog(serviceData: service,));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
