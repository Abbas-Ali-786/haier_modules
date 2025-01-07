import 'package:flutter/material.dart';
import 'package:haier_modules/view/haier_mall_lucky_draw/bullets_point.dart';

class TermOfServiceDialogBox extends StatelessWidget {
  BuildContext context;
  TermOfServiceDialogBox({super.key, required this.context});

  static termOfServiceDialogBox(BuildContext context) {
    showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          titlePadding: const EdgeInsets.all(8),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                child: Text(
                  'Terms & Conditions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          content: SizedBox(
            height: MediaQuery.of(context).size.height - 400,
            width: MediaQuery.of(context).size.width - 100,
            child: SingleChildScrollView(
              child: ListBody(
                children: const [
                  Text(
                    '1. Eligibility',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  BulletPoint(
                      'Customers must provide valid supporting documents, including a warranty card, purchase invoice, and the actual product.'),
                  BulletPoint(
                      'Haier reserves the right to verify the provided documents and product through GTM scanning and physical inspection.'),
                  SizedBox(height: 10),
                  Text(
                    '2. Lucky Draw Entries',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  BulletPoint(
                      'Each product purchase is eligible for one entry into the lucky draw.'),
                  BulletPoint(
                      'Purchases made outside the promotional period will not qualify for the lucky draw.'),
                  SizedBox(height: 10),
                  Text(
                    '3. Prize Conditions',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  BulletPoint(
                      'The prize is non-transferable, non-exchangeable, and cannot be redeemed for cash or other alternatives.'),
                  BulletPoint(
                    'The decision of Haier regarding the winner(s) is final and binding.',
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '4. Winner Notification',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  BulletPoint(
                      'Winners will be notified via phone using the contact details provided during registration on the Haier Mall portal.'),
                  BulletPoint(
                      'Winners may also check their status using the link provided on the Haier Mall website.'),
                  SizedBox(height: 10),
                  Text(
                    '5. Prize Delivery',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  BulletPoint(
                      'The prize will be delivered or made available for collection within seven (7) days from the date of winner notification.'),
                  SizedBox(height: 10),
                  Text(
                    '6. Disqualification',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  BulletPoint(
                      'Haier reserves the right to disqualify any participant found violating these terms and conditions or engaging in fraudulent activities.'),
                  SizedBox(height: 10),
                  Text(
                    '7. Modification of Terms',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  BulletPoint(
                      'Haier reserves the right to modify, suspend, or terminate the promotion at any time without prior notice.'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
