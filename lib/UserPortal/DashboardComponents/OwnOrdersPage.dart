import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';

import '../../CustomWidgets/Snakbar.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});
  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "My Orders",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Orders')
            .where('uid', isEqualTo: user!.uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No orders found"));
          }

          final orders = snapshot.data!.docs;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index].data() as Map<String, dynamic>;
              return _orderCard(order,orders[index].id);
            },
          );
        },
      ),
    );
  }

  Widget _orderCard(Map<String, dynamic> order,String orderId) {
    Color statusColor;
    switch (order["status"]) {
      case "Pending":
        statusColor = Colors.orange;
        break;
      case "Accepted":
        statusColor = Colors.blue;
        break;
      case "Cancelled":
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 5),
            )
          ],
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/onetoone.webp',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image, size: 100),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          title: order["serviceDetails"]['type'] ?? "No Title",
                          color: Colors.black,
                          weight: FontWeight.bold,
                          size: 16,
                        ),
                        const SizedBox(height: 5),
                        CustomTextWidget(
                          title: "Price: ${order["serviceDetails"]['price'] ?? 'N/A'} AED",
                          color: Colors.black54,
                          size: 14,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Status:",
                              color: Colors.black54,
                              weight: FontWeight.w500,
                              size: 14,
                            ),
                            const SizedBox(width: 5),
                            CustomTextWidget(
                              title: order["status"] ?? "Unknown",
                              color: statusColor,
                              weight: FontWeight.bold,
                              size: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (order["status"] == "Pending")
                    ElevatedButton(
                      onPressed: ()async {
                        try {
                          await FirebaseFirestore.instance.collection('Orders').doc(orderId).update({
                            'status': 'Canceled',
                            'canceled_at': FieldValue.serverTimestamp(),
                          });
                        } catch (e) {
                          showErrorSnackbar('Error canceling order: $e');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const CustomTextWidget(
                        title: "Cancel Order",
                          color: Colors.white,
                          weight: FontWeight.bold,
                          size: 14,
                      ),
                    ),
                  if (order["status"] != "Pending")
                    ElevatedButton(
                      onPressed: () {
                        // Add functionality for deleting the order.
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
