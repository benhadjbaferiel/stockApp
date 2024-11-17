import 'package:flutter/material.dart';

class SecondDropDownButon extends StatefulWidget {
  final String? selectedValue;
  final String labelText;
  final List<String> items;
  TextEditingController? controller;
  final void Function(int?)? onChanged; // Update the type to accept index

  SecondDropDownButon({
    Key? key,
    required this.selectedValue,
    required this.labelText,
    required this.items,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  State<SecondDropDownButon> createState() => _dropDownButtonState();
}

class _dropDownButtonState extends State<SecondDropDownButon> {
  late String _currentValue;

  @override
  void initState() {
    super.initState();
    if (widget.selectedValue != null &&
        widget.items.contains(widget.selectedValue)) {
      _currentValue = widget.selectedValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _currentValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.labelText,
        labelStyle: TextStyle(fontSize: 16),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      ),
      items: widget.items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _currentValue = value!;
        });
        if (widget.onChanged != null) {
          int selectedIndex = widget.items.indexOf(value!);
          widget.onChanged!(selectedIndex);
        }
      },
    );
  }
}
