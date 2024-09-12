import 'dart:ui';

import 'package:flutter/material.dart';

class InkwellF extends StatefulWidget {
  final String label;
  final IconData Icon;
  final VoidCallback callbackHandle;

  InkwellF({
    Key? key,
    required this.label,
    required this.callbackHandle,
    required this.Icon,
  }) : super(key: key);

  @override
  State<InkwellF> createState() => _InkwellState();
}

class _InkwellState extends State<InkwellF> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
          onTap: widget.callbackHandle,
          child: Container(
            height: 60,
            width: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
            ),
            child: Row(
              children: [Text(widget.label), Icon(widget.Icon)],
            ),
          )),
    ]);
  }
}
