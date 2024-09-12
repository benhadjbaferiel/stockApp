import 'package:flutter/material.dart';

class customtextfield extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const customtextfield({
    required this.label,
    required this.icon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: Icon(icon),
        hintText: label,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
