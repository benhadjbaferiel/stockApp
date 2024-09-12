import 'package:flutter/material.dart';

class buildPrice extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  buildPrice({Key? key, required this.label, required this.controller})
      : super(key: key);

  @override
  State<buildPrice> createState() => _buildPriceState();
}

class _buildPriceState extends State<buildPrice> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.label),
        Container(
          width: 80,
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
