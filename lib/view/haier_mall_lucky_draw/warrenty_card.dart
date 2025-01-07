import 'package:flutter/material.dart';

class WarrentyCard extends StatelessWidget {
  const WarrentyCard({super.key});

  static showWarrentyCard(BuildContext context) {
    showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          width: MediaQuery.of(context).size.width - 200,
          child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Image(
                  image: AssetImage('assets/luckyDraw/warrenty_card.png'),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => throw UnimplementedError();
}
