import 'package:flutter/material.dart';
import 'package:haier_modules/view/haier_mall_lucky_draw/bullets_point.dart';
import 'package:haier_modules/view/haier_mall_lucky_draw/lucky_draw_form.dart';
import 'package:haier_modules/view/haier_mall_lucky_draw/participated_screen.dart';
import 'package:haier_modules/view/haier_mall_lucky_draw/term_of_service_dialogbox.dart';

void main() {
  runApp(const LuckyDrawScreen());
}

class LuckyDrawScreen extends StatefulWidget {
  const LuckyDrawScreen({Key? key}) : super(key: key);

  @override
  State<LuckyDrawScreen> createState() => _LuckyDrawScreenState();
}

class _LuckyDrawScreenState extends State<LuckyDrawScreen> {
  var checkbox = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lucky Draw'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Top Image
              SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.asset('assets/luckyDraw/lucky_draw.png'),
                    Positioned(
                      bottom: 15,
                      left: 15,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextButton(
                            onPressed: () {
                              debugPrint('Winner’s History button pressed');
                            },
                            child: Text(
                              'Winner’s History',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
              ),

              // Form Container
              Container(
                margin: const EdgeInsets.all(12.0),

                // padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title Bar
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      color: const Color(0XFF0159A1),
                      width: double.infinity,
                      child: const Text(
                        '100% OFF',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    // Hardcoded Text with Points
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const Text(
                            'Simply join the campaign by providing details below. Make sure your info is correct to claim the final reward!',
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                BulletPoint(
                                    'Any customer who purchases a Haier product in 2025 is eligible to participate in lucky draw.'),
                                BulletPoint(
                                    'Customers can submit multiple entries, with each entry linked to a unique product serial number.'),
                                BulletPoint(
                                    'A live lucky draw will be conducted weekly, selecting winners from the past seven days.'),
                                BulletPoint(
                                    'Seven winners will be chosen each week, one from each day, based on unique numbers through a random lucky draw process.'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    // Lucky Draw Form
                    LuckyDrawForm(),
                    SizedBox(height: 8),

                    // Checkbox and Terms of Services
                    Row(
                      children: [
                        Checkbox(
                            value: checkbox,
                            side: BorderSide(color: Colors.grey[500]!),
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                checkbox = value!;
                              });

                              debugPrint('Checkbox pressed');
                            }),
                        const Text(
                          'I agree to ',
                          style: TextStyle(
                            color: Color(0XFF606266),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            TermOfServiceDialogBox.termOfServiceDialogBox(
                                context);
                          },
                          child: const Text(
                            'Terms of Services',
                            style: TextStyle(
                                color: Color(0XFF606266),
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    // Join Now Button
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
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
                              builder: (context) => const ParticipatedScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Join Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    // Footer Text
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: const Text(
                        '***Entries are daily and displayed by date, with 7 selections made after a week!',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
