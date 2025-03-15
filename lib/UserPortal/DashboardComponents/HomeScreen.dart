import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import '../../Controllers/home_controller.dart';
import '../../CustomWidgets/CustomCards/group_session.dart';
import '../../CustomWidgets/CustomCards/private_session.dart';
import '../../CustomWidgets/CustomCards/uniform_booking_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final filterController = Get.put(FilterController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: const CustomTextWidget(
          title: "Gaps Football",
          color: Colors.white,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
             child:  Row(
                children: [
                  FilterButton(filter: 'All', filterController: filterController),
                  SizedBox(width: 10,),
                  FilterButton(filter: 'Uniform Booking', filterController: filterController),
                  SizedBox(width: 10,),
                  FilterButton(filter: 'Private One-on-One Session', filterController: filterController),
                  SizedBox(width: 10,),
                  FilterButton(filter: 'Group Session Booking', filterController: filterController),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                String selectedFilter = filterController.selectedFilter.value;
                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('services').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No Services Available'));
                    }
                    var services = snapshot.data!.docs;
                    var filteredServices = services.where((service) {
                      var serviceType = (service.data() as Map<String, dynamic>)['type'] ?? '';
                      return selectedFilter == 'All' || serviceType == selectedFilter;
                    }).toList();

                    return ListView.builder(
                      itemCount: filteredServices.length,
                      itemBuilder: (context, index) {
                        var service = filteredServices[index].data() as Map<String, dynamic>;
                        String type = service['type'] ?? '';
                        String docId = filteredServices[index].id;

                        if (type == 'Uniform Booking') {
                          return UniformBookingCard(service: service, docId: docId, userRole: 'users');
                        } else if (type == 'Private One-on-One Session') {
                          return PrivateSessionCard(service: service, docId: docId, userRole: 'users');
                        } else if (type == 'Group Session Booking') {
                          return GroupSessionCard(service: service, docId: docId, userRole: 'users');
                        } else {
                          return SizedBox();
                        }
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String filter;
  final FilterController filterController;

  const FilterButton({
    Key? key,
    required this.filter,
    required this.filterController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return ElevatedButton(
        onPressed: () => filterController.setFilter(filter),
        style: ElevatedButton.styleFrom(
          backgroundColor: filterController.selectedFilter.value == filter
              ? Colors.amber
              : Colors.grey,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: CustomTextWidget(
         title:  filter,
          color: Colors.white,
        ),
      );
    });
  }
}
