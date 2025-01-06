import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextfieldsDecorations extends StatefulWidget {
  String text;
  TextfieldsDecorations({super.key, required this.text});

  @override
  State<TextfieldsDecorations> createState() => _TextfieldsDecorationsState();
}

class _TextfieldsDecorationsState extends State<TextfieldsDecorations> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.text,
        labelStyle: const TextStyle(
          color: Color(0XFFA8ABB2),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0XFFDCDFE6),
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        isDense: true,
      ),
    );
  }
}
