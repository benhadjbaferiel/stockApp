import 'package:flutter/material.dart';

class CustomSettings extends StatelessWidget {
  final String label;

  CustomSettings({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          // TextField inside a small container
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none, // Remove the default TextField border
                ),
              ),
            ),
          ),
          const SizedBox(width: 50), // Space between the TextField and the label
          // The label next to the TextField
          Text(
            label,
            style: TextStyle(fontSize: 18),

          ),
                        const SizedBox(width: 50), // Space between the TextField and the label

        ],
      ),
    );
  }
}
