import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gaps_football_app/Controllers/orders_controller.dart';

import '../../CustomWidgets/TextWidget.dart';

class OrderRequestScreen extends StatelessWidget {
  OrderRequestScreen({super.key});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const CustomTextWidget(
          title: "Order Requests",
          color: Colors.black,
          weight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('Orders').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: CustomTextWidget(title: 'Error: ${snapshot.error}'));
            }
            final orderRequests = snapshot.data?.docs ?? [];

            return ListView.builder(
              itemCount: orderRequests.length,
              itemBuilder: (context, index) {
                final order = orderRequests[index].data() as Map<String, dynamic>;
                var orderID = orderRequests[index].id;

                final name = order['name'] ?? 'Unknown User';
                final status = order['status'] ?? 'Pending';
                final type = order['serviceDetails']['type'] ?? 'N/A';
                final price = order['price'] ?? '0';
                final createdAt = order['created_at']?.toDate()?.toString() ?? 'Unknown';

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                              title: name,
                              size: 18,
                              weight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            Chip(
                              label: Text(
                                status,
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: status == 'Pending'
                                  ? Colors.amber
                                  : status == 'Canceled'
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomTextWidget(
                          title: "Service: $type",
                          size: 16,
                          color: Colors.black87,
                        ),
                        const SizedBox(height: 5),
                        CustomTextWidget(
                          title: "Price: $price",
                          size: 14,
                          color: Colors.black54,
                        ),
                        const SizedBox(height: 5),
                        CustomTextWidget(
                          title: "Order Date: $createdAt",
                          size: 14,
                          color: Colors.black54,
                        ),
                        const SizedBox(height: 15),
                        status == 'Pending'
                            ? Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: ()async {
                                  await orderConfirmation(orderID,'Canceled');
                                },
                                child: const CustomTextWidget(
                                 title:  "Approve",
                                    color: Colors.white,
                                    size: 16,
                                    weight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () async {
                                  await orderConfirmation(orderID,'Approved');
                                },
                                child: const CustomTextWidget(
                                  title: "Reject",
                                    color: Colors.white,
                                    size: 16,
                                    weight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                            : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: ()async {
                            await deleteOrder(orderID);
                          },
                          child: const Text(
                            "Delete",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
