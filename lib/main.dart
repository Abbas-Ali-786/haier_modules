import 'package:flutter/material.dart';
import 'package:haier_modules/view/haier_mall_lucky_draw/winner_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WinnerScreen(),
    );
  }
}
