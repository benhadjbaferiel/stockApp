import 'package:flutter/material.dart';

class textimpot extends StatefulWidget {
  final String label;
  const textimpot({Key? key, required this.label}) : super(key: key);

  @override
  State<textimpot> createState() => _textimpotState();
}

class _textimpotState extends State<textimpot> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 160, 166, 172), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: TextEditingController(),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            style: TextStyle(fontSize: 18),
          ),
        ),
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
