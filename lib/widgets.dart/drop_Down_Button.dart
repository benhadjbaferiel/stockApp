import 'package:flutter/material.dart';

class dropDownButton extends StatefulWidget {
  final String? selectedValue;
  final String labelText;
  final List<String> items;
  TextEditingController? controller;
  final void Function(String?)? onChanged; // Update the type

  dropDownButton({
    Key? key,
    required this.selectedValue,
    required this.labelText,
    required this.items,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  State<dropDownButton> createState() => _dropDownButtonState();
}

class _dropDownButtonState extends State<dropDownButton> {
  String? _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.selectedValue;
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
          _currentValue = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
    );
  }
}
