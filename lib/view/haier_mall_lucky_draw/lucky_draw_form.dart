import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haier_modules/view/haier_mall_lucky_draw/show_calender.dart';
import 'package:haier_modules/view/haier_mall_lucky_draw/textfields_decorations.dart';
import 'package:haier_modules/view/haier_mall_lucky_draw/warrenty_card.dart';

class LuckyDrawForm extends StatefulWidget {
  const LuckyDrawForm({super.key});

  @override
  State<LuckyDrawForm> createState() => _LuckyDrawFormState();
}

class _LuckyDrawFormState extends State<LuckyDrawForm> {
  Timer? _timer;
  int _remainingSeconds = 0;
  bool _showResend = false;

  void startTimer() {
    _remainingSeconds = 30;
    _showResend = false;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer?.cancel();
          _showResend = true;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          const Text('Name'),
          TextfieldsDecorations(text: 'Enter Name'),
          const SizedBox(height: 8),
          const Text('Phone Number*'),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                decoration: BoxDecoration(
                  color: Color(0XFFF2F3F5),
                  border: Border.all(
                    color: Color(0XFFDCDFE6),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text('+92',
                    style: TextStyle(
                      color: Color(0XFFA8ABB2),
                    )),
              ),
              Expanded(
                child: TextfieldsDecorations(text: 'Enter Phone Number'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextfieldsDecorations(
                  text: 'Enter Verification Code',
                  textInputType: TextInputType.phone,
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  maximumSize: const Size(120, 44),
                  minimumSize: const Size(120, 44),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  startTimer();
                },
                child: Text(
                  _remainingSeconds > 0 ? '${_remainingSeconds}s' : 'Get Code',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
          if (_showResend)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextButton(
                onPressed: () {
                  startTimer();
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Didn,t receive code? ',
                        style: TextStyle(color: Color(0XFF606266)),
                      ),
                      TextSpan(
                        text: 'Resend',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF0159A1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          const SizedBox(height: 3),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Product Serial Number*'),
                IconButton(
                  icon: const Icon(
                    Icons.info_outline,
                    color: Color(0XFF8A8B8E),
                    size: 20,
                  ),
                  onPressed: () {
                    WarrentyCard.showWarrentyCard(context);
                  },
                ),
              ],
            ),
          ),
          TextfieldsDecorations(
            text: 'Product Serial Number',
          ),
          const SizedBox(height: 8),
          const Text('Participation Date*'),
          const SizedBox(height: 3),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Participation Date',
              labelStyle: TextStyle(
                color: Color(0XFFA8ABB2),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0XFFDCDFE6),
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              isDense: true,
              prefixIcon: ShowCalender(),
            ),
          ),
        ],
      ),
    );
  }
}
