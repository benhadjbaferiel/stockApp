import 'package:flutter/material.dart';

class CustomDropMenu extends StatefulWidget {
  final String label;
  final List<String> items;
  final Function(String?)? onChanged;
  final String? selectedValue;



  CustomDropMenu({
      Key? key,
      required this.label,
      required this.items,
     required this.onChanged,
     required this.selectedValue,
     
  
  }): super(key: key);

  @override
  State<CustomDropMenu> createState() => _CustomDropMenuState();
}

class _CustomDropMenuState extends State<CustomDropMenu> {
  @override
  Widget build(BuildContext context) {
    return  
              Container(
                width: 350,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text(widget.label),
                    value: widget.selectedValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    elevation: 16,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    onChanged: widget.onChanged,
                    items: widget.items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
  }
}