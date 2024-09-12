import 'package:flutter/material.dart';

class customControl extends StatelessWidget {
  final String label;
  const customControl({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Row(children: [
          Container(
            height: 50,
            width: 200,
            color: const Color.fromARGB(255, 226, 209, 209),
            //child:,
          ),
          SizedBox(width: 0),
          Text(
            label,
          ),
        ]));
  }
}
