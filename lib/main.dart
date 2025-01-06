import 'package:flutter/material.dart';
import 'package:haier_modules/view/haier_mall_checkIn/coin_history_screen.dart';
import 'package:haier_modules/view/haier_mall_checkIn/daily_checkIn_screen.dart';
import 'package:haier_modules/view/haier_mall_invoice_pdf/pdf_invoice.dart';
import 'package:haier_modules/view/haier_mall_lucky_draw/lucky_draw_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LuckyDrawScreen(),
    );
  }
}
