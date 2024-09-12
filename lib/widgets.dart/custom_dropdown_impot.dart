import 'package:flutter/material.dart';

class CustomImpot1 extends StatefulWidget {
  final String label;
  const CustomImpot1({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  State<CustomImpot1> createState() => _CustomImpotState();
}

class _CustomImpotState extends State<CustomImpot1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 550,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          DropdownButton<int>(
            value: 4,
            items: [1, 2, 3, 4, 5].map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text('$value'),
              );
            }).toList(),
            onChanged: (value) {
              // Handle change here
            },
          ),
          SizedBox(
            width: 140,
          ),
          Text(widget.label)
        ],
      ),
    );
  }
}
