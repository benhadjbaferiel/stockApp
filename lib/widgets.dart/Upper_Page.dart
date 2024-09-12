import 'package:flutter/material.dart';

class UperPage extends StatelessWidget {
  final String label;
  final String imagePath; // Added to allow image customization

  const UperPage({
    Key? key,
    required this.label,
    required this.imagePath, // Required for the image customization
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
          ),
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(width: 50),
              Image.asset(
                imagePath,
                width: 100,
                height: 100,
                alignment: Alignment.topLeft,
              ),
            ],
          ),
        ],
    );
  }
}
