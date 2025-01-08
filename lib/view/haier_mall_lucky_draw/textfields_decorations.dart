import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class TextfieldsDecorations extends StatefulWidget {
  String text;
  TextInputType? textInputType;
  bool isSuffixIcon;

  TextfieldsDecorations({
    super.key,
    required this.text,
    this.textInputType,
    this.isSuffixIcon = false,
  });

  @override
  State<TextfieldsDecorations> createState() => _TextfieldsDecorationsState();
}

class _TextfieldsDecorationsState extends State<TextfieldsDecorations> {
  List<File> selectedFiles = [];
  bool isPickerActive = false;
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  Future<void> pickFile() async {
    if (isPickerActive) return;

    try {
      isPickerActive = true;
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: true,
        allowedExtensions: ['jpg', 'png', 'pdf'],
      );

      if (result != null) {
        setState(() {
          selectedFiles
              .addAll(result.paths.map((path) => File(path!)).toList());
        });
      }
    } finally {
      isPickerActive = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          keyboardType: widget.textInputType ?? TextInputType.text,
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
            suffixIcon: widget.isSuffixIcon
                ? GestureDetector(
                    onTap: pickFile,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        'assets/luckyDraw/upload_icon.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : null,
          ),
        ),
        if (selectedFiles.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: selectedFiles.map((file) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              file,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 4,
                          top: 4,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedFiles.remove(file);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.close,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
      ],
    );
  }
}
