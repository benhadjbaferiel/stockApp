import 'package:flutter/material.dart';

class BuildListItem extends StatefulWidget {
final String title;
final VoidCallback callbackHandle2;

  BuildListItem({
    Key? key,
    required this.title,
    required this.callbackHandle2,
  }) : super(key: key);

  @override
  State<BuildListItem> createState() => _BuildListItemState();
}

class _BuildListItemState extends State<BuildListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios), 
                onPressed: 
                  widget.callbackHandle2
                 
                 // Handle the button press
              ),
            ),
           Text(
              widget.title,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    

  }
}