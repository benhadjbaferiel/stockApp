import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDate extends StatefulWidget {
   CustomDate({Key? key}) : super(key: key);

  @override
  State<CustomDate> createState() => _CustomDateState();
}

class _CustomDateState extends State<CustomDate> {
  DateTime _selectedDate = DateTime.now();

  void _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showDatePicker,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('yyyy-MM-dd').format(_selectedDate),
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            Icon(Icons.calendar_today, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
