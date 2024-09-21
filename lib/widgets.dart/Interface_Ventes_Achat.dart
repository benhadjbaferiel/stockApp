import 'package:flutter/material.dart';
import '/widgets.dart/custom_bar.dart';

class InterfaceVenteAchat extends StatefulWidget {
  final String title;
  final Map<String, VoidCallback> menuItems;

  const InterfaceVenteAchat({
    Key? key,
    required this.title,
    required this.menuItems,
  }) : super(key: key);

  @override
  State<InterfaceVenteAchat> createState() => _InterfaceVenteAchatState();
}

class _InterfaceVenteAchatState extends State<InterfaceVenteAchat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.menu),
            onSelected: (String value) {
              widget.menuItems[value]?.call();
            },
            itemBuilder: (context) => widget.menuItems.keys.map((item) {
              return PopupMenuItem(
                child: Text(item),
                value: item,
              );
            }).toList(),
          ),
        ],
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 176, 171, 86),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Custombar(),
            SizedBox(height: 5),
            Container(
              color: Colors.grey[200],
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "الإجمالي",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "الكمية",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 65,
                  ),
                  Text(
                    "التكلفة",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    "المنتج",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
