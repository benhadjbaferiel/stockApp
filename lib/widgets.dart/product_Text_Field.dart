import 'package:flutter/material.dart';

class ProductTextField extends StatefulWidget {
  final TextEditingController cntrl;
  final String labelText;

  ProductTextField({
    Key? key,
    required this.cntrl,
    required this.labelText,
  }) : super(key: key);

  @override
  State<ProductTextField> createState() => _ProductTextFieldState();
}

class _ProductTextFieldState extends State<ProductTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.cntrl,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.labelText,
        labelStyle: TextStyle(fontSize: 16),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      ),
    );
  }
}
