import 'package:flutter/material.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "title": "Payment Received",
      "description": "Your payment of \$150 has been processed.",
      "time": "10:30 AM",
      "icon": "check_circle",
    },
    {
      "title": "New Message",
      "description": "You have a new message from John.",
      "time": "9:45 AM",
      "icon": "message",
    },
    {
      "title": "Update Available",
      "description": "A new version of the app is available.",
      "time": "8:20 AM",
      "icon": "update",
    },
    {
      "title": "Feedback Reminder",
      "description": "Don't forget to leave your feedback.",
      "time": "Yesterday",
      "icon": "rate_review",
    },
    {
      "title": "Task Completed",
      "description": "Your task has been successfully completed.",
      "time": "2 days ago",
      "icon": "done",
    },
  ];
  NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          title: "Notifications",
          size: 22,
          weight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.amber.shade100,
                  child: Icon(
                    _getIcon(notification['icon']!),
                    color: Colors.amber.shade700,
                    size: 30,
                  ),
                ),
                title: CustomTextWidget(
                  title: notification['title']!,
                  size: 18,
                  weight: FontWeight.bold,
                  color: Colors.black,
                ),
                subtitle: CustomTextWidget(
                  title: notification['description']!,
                  size: 14,
                  color: Colors.black54,
                ),
                trailing: CustomTextWidget(
                  title: notification['time']!,
                  size: 12,
                  color: Colors.grey,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  IconData _getIcon(String iconName) {
    switch (iconName) {
      case "check_circle":
        return Icons.check_circle;
      case "message":
        return Icons.message;
      case "update":
        return Icons.update;
      case "rate_review":
        return Icons.rate_review;
      case "done":
        return Icons.done;
      default:
        return Icons.notifications;
    }
  }
}
