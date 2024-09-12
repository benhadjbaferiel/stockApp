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
      body: Column(
        children: [
          Custombar(),
          SizedBox(height: 16), // Optional: Add some spacing
          Expanded(
            // Ensure DataTable takes up the remaining space
            child: SingleChildScrollView(
              // Allow scrolling for the table
              child: DataTable(
                columns: const [
                  DataColumn(label: Text("المنتج")),
                  DataColumn(label: Text("التكلفة")),
                  DataColumn(label: Text("الكمية")),
                  DataColumn(label: Text("الاجمالي")),
                ],
                rows: [], // Add your rows here
              ),
            ),
          ),
        ],
      ),
    );
  }
}
