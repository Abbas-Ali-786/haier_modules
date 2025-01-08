import 'package:flutter/material.dart';
import 'package:haier_modules/view/haier_mall_lucky_draw/textfields_decorations.dart';

class WinnerForm extends StatefulWidget {
  const WinnerForm({super.key});

  @override
  State<WinnerForm> createState() => _WinnerFormState();
}

class _WinnerFormState extends State<WinnerForm> {
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
                  child: TextfieldsDecorations(
                      text: 'Enter Phone Number',
                      textInputType: TextInputType.number)),
            ],
          ),
          const SizedBox(height: 8),
          const Text('CNIC*'),
          TextfieldsDecorations(
            text: 'xxxxx-xxxxxxx-x',
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          const Text('City*'),
          TextfieldsDecorations(
            text: 'xxxxx-xxxxxxx-x',
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          const Text('Province*'),
          TextfieldsDecorations(text: 'xxxxx-xxxxxxx-x'),
          const SizedBox(height: 8),
          const Text('Address*'),
          TextfieldsDecorations(text: 'Enter address'),
          const SizedBox(height: 8),
          Text('Upload Invoice*'),
          TextfieldsDecorations(text: 'Upload image', isSuffixIcon: true),
          const Text(
            'Accepted file formats: JPG, PNG, PDF',
            style: TextStyle(color: Color(0XFF909399)),
          ),
          const SizedBox(height: 8),
          const Text('Upload Warranty Card*'),
          TextfieldsDecorations(text: 'Upload image', isSuffixIcon: true),
          const Text(
            'Accepted file formats: JPG, PNG, PDF',
            style: TextStyle(color: Color(0XFF909399)),
          ),
        ],
      ),
    );
  }
}
