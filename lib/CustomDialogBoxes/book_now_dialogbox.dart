import 'package:flutter/material.dart';
import 'package:gaps_football_app/CustomWidgets/custom_textfield.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import 'package:get/get.dart';
import '../Controllers/book_now_controller.dart';
import '../CustomWidgets/custom_dropdown.dart';

class BookNowDialog extends StatelessWidget {
  final Map<String, dynamic> serviceData;
  BookNowDialog({super.key, required this.serviceData});
  final BookNowController controller = Get.put(BookNowController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                title: 'Enter Your Details',
                size: 20,
                weight: FontWeight.bold,
                color: Colors.amber,
              ),
              const SizedBox(height: 20),
              if (serviceData['type'] == 'Uniform Booking') ...[
                CustomDropdown(
                  title: 'Kit Size',
                  options: ['Small', 'Medium', 'Large'],
                  value: controller.kitSize.value.isNotEmpty
                      ? controller.kitSize.value
                      : null,
                  onChanged: (value) => controller.kitSize.value = value!,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  title: 'Kit Name',
                  controller: controller.kitNameController,
                  type: TextInputType.text,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  title: 'Quantity',
                  controller: controller.quantityController,
                  type: TextInputType.number,
                ),
              ],
              if (serviceData['type'] == 'Group Session Booking') ...[
                CustomTextField(
                  title: 'Name',
                  controller: controller.nameController,
                  type: TextInputType.text,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  title: 'Age',
                  controller: controller.ageController,
                  type: TextInputType.number,
                ),
                const SizedBox(height: 15),
                CustomDropdown(
                  title: 'Gender',
                  options: ['Male', 'Female', 'Other'],
                  value: controller.sex.value.isNotEmpty
                      ? controller.sex.value
                      : null,
                  onChanged: (value) => controller.sex.value = value!,
                ),
                const SizedBox(height: 15),
                CustomDropdown(
                  title: 'Position',
                  options: ['Forward', 'Midfielder', 'Defender', 'Goalkeeper'],
                  value: controller.position.value.isNotEmpty
                      ? controller.position.value
                      : null,
                  onChanged: (value) => controller.position.value = value!,
                ),
                const SizedBox(height: 15),
                CustomDropdown(
                  title: 'Level',
                  options: ['Beginner', 'Advanced', 'Development'],
                  value: controller.level.value.isNotEmpty
                      ? controller.level.value
                      : null,
                  onChanged: (value) => controller.level.value = value!,
                ),
              ],
              if (serviceData['type'] == 'Private One-on-One Session') ...[
                CustomTextField(
                  title: 'Name',
                  controller: controller.nameController,
                  type: TextInputType.text,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  title: 'Age',
                  controller: controller.ageController,
                  type: TextInputType.number,
                ),
                const SizedBox(height: 15),
                CustomDropdown(
                  title: 'Gender',
                  options: ['Male', 'Female', 'Other'],
                  value: controller.sex.value.isNotEmpty
                      ? controller.sex.value
                      : null,
                  onChanged: (value) => controller.sex.value = value!,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  title: 'Location',
                  controller: controller.locationController,
                  type: TextInputType.text,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  title: 'Area of Concentration',
                  controller: controller.concentrationController,
                  type: TextInputType.text,
                ),
              ],
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: CustomTextWidget(
                      title: 'Cancel',
                      color: Colors.grey[600],
                    ),
                  ),
                  controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      controller.isLoading.value = true;
                      controller.saveDetails(serviceData);
                    },
                    child: CustomTextWidget(
                      title: 'Save',
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
