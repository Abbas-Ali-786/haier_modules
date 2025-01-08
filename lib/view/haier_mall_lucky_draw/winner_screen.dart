import 'package:flutter/material.dart';
import 'package:haier_modules/view/haier_mall_lucky_draw/winner_form.dart';

class WinnerScreen extends StatefulWidget {
  const WinnerScreen({super.key});

  @override
  State<WinnerScreen> createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  var checkbox = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Winners Screen'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Top Image
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Image.asset('assets/luckyDraw/gift_box.png',
                      fit: BoxFit.fill),
                ),
              ),

              // Form Container
              Container(
                margin: const EdgeInsets.all(12.0),
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

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SizedBox(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 2,
                            children: [
                              Text(
                                'Daily lucky draw',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Congratulations!',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                'Make sure your info is correct to claim the final reward!',
                              ),
                            ]),
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),

                    // Winner Form
                    WinnerForm(),
                    SizedBox(height: 20),

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
                        Expanded(
                          child: Text(
                            'I confirm that all the personal details I’ve provided are accurate',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0XFF606266),
                            ),
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
                        onPressed: () {},
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Add this to your _WinnerScreenState class
}
