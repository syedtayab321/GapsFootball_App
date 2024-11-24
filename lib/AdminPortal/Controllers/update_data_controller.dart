import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/Snakbar.dart';

class UpdateDataController extends GetxController {
  var selectedType = ''.obs;
  var price = ''.obs;
  var availableSizes = ''.obs;
  var location = ''.obs;
  var ageGroup = ''.obs;
  var customAgeGroup = ''.obs;
  var selectedDays = ''.obs;
  var selectedTimeSlots = ''.obs;
  var description = ''.obs;
  var serviceId = ''.obs;
  var isLoading = false.obs;

  List<String> daysOfWeek = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
  ];

  List<String> ageGroups = ['4-15', '8-14', '7-10', 'Other'];

  List<String> kitSizes = [
    'Small', 'Medium', 'Large', 'Extra Large'
  ];

  List<String> bookingTypes = [
    'Uniform Booking',
    'Group Session Booking',
    'Private One-on-One Session'
  ];


  Future<void> getServiceDataForEditing(String docId) async {
    isLoading.value = true;
    try {
      DocumentSnapshot serviceDoc =
      await FirebaseFirestore.instance.collection('services').doc(docId).get();

      if (serviceDoc.exists) {
        Map<String, dynamic> data = serviceDoc.data() as Map<String, dynamic>;

        selectedType.value = data['type'] ?? '';
        serviceId.value = docId;

        if (selectedType.value == 'Uniform Booking') {
          price.value = data['price'] ?? '';
          availableSizes.value = data['availableSize'] ?? '';
        } else if (selectedType.value == 'Group Session Booking') {
          location.value = data['location'] ?? '';
          ageGroup.value = data['ageGroup'] ?? '';
          customAgeGroup.value = data['customAgeGroup'] ?? '';
          selectedDays.value = data['selectedDay'] ?? '';
          selectedTimeSlots.value = data['selectedTimeSlot'] ?? '';
        } else if (selectedType.value == 'Private One-on-One Session') {
          description.value = data['description'] ?? '';
          price.value = data['price'] ?? '';
        }
      } else {
        showErrorSnackbar("Service not found.");
      }
    } catch (e) {
      showErrorSnackbar('Error fetching service data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateService() async {
    if (serviceId.value.isEmpty) {
      return;
    }

    Map<String, dynamic> updatedServiceData = {
      'type': selectedType.value,
      'updatedAt': Timestamp.now(),
    };

    if (selectedType.value == 'Uniform Booking') {
      updatedServiceData.addAll({
        'price': price.value,
        'availableSize': availableSizes.value,
      });
    } else if (selectedType.value == 'Group Session Booking') {
      updatedServiceData.addAll({
        'location': location.value,
        'ageGroup': ageGroup.value,
        'customAgeGroup': customAgeGroup.value.isNotEmpty ? customAgeGroup.value : null,
        'selectedDay': selectedDays.value,
        'selectedTimeSlot': selectedTimeSlots.value,
      });
    } else if (selectedType.value == 'Private One-on-One Session') {
      updatedServiceData.addAll({
        'description': description.value,
        'price': price.value,
      });
    }

    updatedServiceData.removeWhere((key, value) => value == null || (value is List && value.isEmpty));

    try {
      await FirebaseFirestore.instance.collection('services').doc(serviceId.value).update(updatedServiceData);
      showSuccessSnackbar('Service updated successfully!');
      Get.back();
    } catch (e) {
      showErrorSnackbar('Failed to update service: $e');
    }
  }

  void resetFields() {
    selectedType.value = '';
    price.value = '';
    availableSizes.value = '';
    location.value = '';
    ageGroup.value = '';
    customAgeGroup.value = '';
    selectedDays.value = '';
    selectedTimeSlots.value = '';
    description.value = '';
    serviceId.value = '';
  }
}
