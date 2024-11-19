import 'package:flutter/material.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'How do I reset my password?',
      'answer': 'To reset your password, go to the settings page and click on "Reset Password". Follow the instructions provided.'
    },
    {
      'question': 'How can I contact support?',
      'answer': 'You can contact support through the "Give Feedback" option in the settings or email us at support@example.com.'
    },
    {
      'question': 'Where can I find my purchase history?',
      'answer': 'Your purchase history is available under the "My Orders" section on your profile page.'
    },
    {
      'question': 'Can I change my email address?',
      'answer': 'Yes, you can change your email address in the "Account Settings" section.'
    },
    {
      'question': 'Is my data secure?',
      'answer': 'We use advanced encryption methods to ensure your data is secure. Refer to our privacy policy for more details.'
    },
  ];

  FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          title: "FAQs",
          size: 22,
          weight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber,
        elevation: 8,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Icon(Icons.help_outline, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              title: 'Frequently Asked Questions',
              size: 24,
              weight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: faqs.length,
                itemBuilder: (context, index) {
                  return _faqCard(faqs[index]['question']!, faqs[index]['answer']!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _faqCard(String question, String answer) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.amber.shade300, Colors.amber.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: CustomTextWidget(
         title: question,
          size: 16,
          weight: FontWeight.bold,
          color: Colors.black,
        ),
        iconColor: Colors.black,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: CustomTextWidget(
              title: answer,
              size: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
