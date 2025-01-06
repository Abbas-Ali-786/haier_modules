import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowCalender extends StatefulWidget {
  const ShowCalender({super.key});

  @override
  State<ShowCalender> createState() => _ShowCalenderState();
}

class _ShowCalenderState extends State<ShowCalender> {
  String selectedDate = 'Participation Date';
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          setState(() {
            selectedDate = DateFormat('DD/MM/yyyy').format(pickedDate);
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0XFFDCDFE6)),
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_today_outlined,
              size: 18,
              color: Color(0XFF8A8B8E),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            Text(
              selectedDate != 'Participation Date'
                  ? selectedDate
                  : 'Participation Date',
              style: TextStyle(
                color: selectedDate != 'Participation Date'
                    ? Colors.black
                    : Color(0XFFA8ABB2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
