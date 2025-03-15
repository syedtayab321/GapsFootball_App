import 'package:flutter/material.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            CustomTextWidget(
              title: 'Privacy Policy for GAPS Football',
              size: 24,
               weight: FontWeight.bold,
               color: Colors.amber,
              align: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomTextWidget(
              title: 'At GAPS Football, we value your privacy and are committed to protecting your personal information. This privacy policy explains how we collect, use, and share your information when you use our football services, including private group session bookings and other offerings.',
              size: 16, color: Colors.black87,
            ),
            const SizedBox(height: 20),
            _buildSection('1. Information We Collect'),
            const SizedBox(height: 10),
            CustomTextWidget(
              title: 'We collect the following types of information when you book a session or interact with our platform:\n\n'
                  '- Personal information like your name, email, phone number, etc.\n'
                  '- Payment information for booking sessions\n'
                  '- Session preferences, including group size and session time\n'
                  '- Location details for session coordination\n\n'
                  'This information helps us provide you with a better booking experience and relevant service updates.',
              size: 16, color: Colors.black54,
            ),
            const SizedBox(height: 20),
            _buildSection('2. How We Use Your Information'),
            const SizedBox(height: 10),
            CustomTextWidget(
              title: 'We use the information we collect for the following purposes:\n\n'
                  '- To facilitate session bookings and confirmations\n'
                  '- To process payments securely\n'
                  '- To communicate with you about session details, changes, and promotions\n'
                  '- To improve our services and enhance your user experience\n',
              size: 16, color: Colors.black54,
            ),
            const SizedBox(height: 20),
            _buildSection('3. Session Bookings and Payments'),
            const SizedBox(height: 10),
            CustomTextWidget(
              title: 'When you book a private group session with GAPS Football, we process your booking information, including your payment details, securely. Bookings are confirmed upon payment, and we may send you reminders or updates regarding your session.\n\n'
                  'We use secure payment gateways for processing all transactions, ensuring that your financial information is kept confidential.',
              size: 16, color: Colors.black54,
            ),
            const SizedBox(height: 20),
            _buildSection('4. Data Security'),
            const SizedBox(height: 10),
            CustomTextWidget(
             title:  'We implement appropriate technical and organizational measures to protect your personal information. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee its absolute security.',
              size: 16, color: Colors.black54,
            ),
            const SizedBox(height: 20),
            _buildSection('5. Sharing Your Information'),
            const SizedBox(height: 10),
            CustomTextWidget(
              title: 'We do not share your personal information with third parties except in the following cases:\n\n'
                  '- To process payments and complete your booking\n'
                  '- To comply with legal obligations\n'
                  '- To protect our rights or the rights of others',
              size: 16, color: Colors.black54,
            ),
            const SizedBox(height: 20),
            _buildSection('6. Your Rights and Choices'),
            const SizedBox(height: 10),
            CustomTextWidget(
              title: 'You have the right to access, correct, or delete your personal information that we hold. You can also opt-out of marketing communications at any time. If you wish to exercise any of these rights, please contact us at the details provided below.',
              size: 16, color: Colors.black54,
            ),
            const SizedBox(height: 20),
            _buildSection('7. Contact Us'),
            const SizedBox(height: 10),
            CustomTextWidget(
              title: 'If you have any questions or concerns about our privacy policy, please contact us at:\n\n'
                  'Email: info@gapsfootball.com\n'
                  'Phone: +1 234 567 890\n'
                  'Website: www.gapsfootball.com\n',
              size: 16, color: Colors.black54,
            ),
            const SizedBox(height: 20),
            CustomTextWidget(
              title: 'By using our services, you consent to the terms outlined in this privacy policy.',
              size: 16, color: Colors.black54,
              align: TextAlign.center,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title) {
    return CustomTextWidget(
     title:  title,
      size: 18,
      weight: FontWeight.bold,
      color: Colors.amber,
    );
  }
}
