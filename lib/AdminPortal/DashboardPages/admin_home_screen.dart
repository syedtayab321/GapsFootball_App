import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/CustomCards/group_session.dart';
import '../../CustomWidgets/CustomCards/private_session.dart';
import '../../CustomWidgets/CustomCards/uniform_booking_card.dart';
import '../../CustomWidgets/admin_drawer.dart';
import '../Forms/booking_form.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

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
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('services').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No Services Available'));
                  }
                  var services = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      var service = services[index].data() as Map<String, dynamic>;
                      String type = service['type'] ?? '';
                      String docId = services[index].id;
                      if (type == 'Uniform Booking') {
                        return UniformBookingCard(service: service,docId:docId,userRole: 'admin',);
                      } else if (type == 'Private One-on-One Session') {
                        return PrivateSessionCard(service:service,docId:docId,userRole: 'admin',);
                      } else if (type == 'Group Session Booking') {
                        return GroupSessionCard(service: service,docId:docId,userRole: 'admin',);
                      } else {
                        return SizedBox();
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Get.to(BookingForm());
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
