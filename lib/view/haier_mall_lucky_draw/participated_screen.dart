import 'package:flutter/material.dart';
import 'package:haier_modules/view/haier_mall_lucky_draw/lucky_draw_video_screen.dart';

class ParticipatedScreen extends StatefulWidget {
  const ParticipatedScreen({super.key});

  @override
  State<ParticipatedScreen> createState() => _ParticipatedScreenState();
}

class _ParticipatedScreenState extends State<ParticipatedScreen> {
  String luckyNumber = '1234567';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        title: const Text('Participated'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top Image
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/luckyDraw/lucky_number.png',
                        fit: BoxFit.fitWidth),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            luckyNumber,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.content_copy_rounded,
                            size: 15,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.all(15.0),
              margin: const EdgeInsets.all(12.0),
              color: Colors.white,
              child: Column(
                spacing: 20,
                children: [
                  Text(
                      'Thanks for participating!!\nDon’t forget to copy your lucky number.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                  Text(
                      'Stay tuned for updates and best of luck! Our winner will receive a confirmation call by our support team directly.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      )),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LuckyDrawVideoScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Continue Shopping',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.all(15.0),
              margin: const EdgeInsets.all(12.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 1,
                children: [
                  Text('What happens next?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 5),
                  const Text(
                    '1. Stay Tuned for the Draw:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    'The lucky draw will be held within the next 7 days, although there might be slight variations depending on the circumstances. We’ll keep you updated with any changes!',
                  ),
                  const Text(
                    '2. Check Your Notifications:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    'We will notify all participants about the results through SMS on provided phone number.',
                  ),
                  const Text(
                    '3. Claiming Your Prize:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    'If your lucky number is chosen, you’ll receive instructions on how to claim your prize. To ensure the prize is awarded to the rightful winner, you’ll need to complete a short verification process. Details about the verification will be shared with the winners.',
                  ),
                  const Text(
                    '4. Contact Us for Support:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    'If you have any questions, feel free to contact our support team at [Support Email or Phone].',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
