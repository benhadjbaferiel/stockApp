import 'package:flutter/material.dart';
import 'package:stock_dz_app/Models/product_model.dart';

class MultiSelectDropDownButton extends StatefulWidget {
  final List<String> selectedValues;
  final String labelText;
  final List<Product> items;
  final void Function(List<String>)? onChanged; // Callback to return selected values

  MultiSelectDropDownButton({
    Key? key,
    required this.selectedValues,
    required this.labelText,
    required this.items,
    this.onChanged,
  }) : super(key: key);

  @override
  State<MultiSelectDropDownButton> createState() =>
      _MultiSelectDropDownButtonState();
}


class _MultiSelectDropDownButtonState
    extends State<MultiSelectDropDownButton> {
  late List<Product> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = List.from(widget.selectedValues); // Initialize with selected values
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openMultiSelectDialog(context),
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.labelText,
          labelStyle: TextStyle(fontSize: 16),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        child: Text(
          _selectedValues.isEmpty
              ? 'Select items'
              : _selectedValues.join(', '),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  void _openMultiSelectDialog(BuildContext context) async {
    final List<String> selectedItems = await showDialog<List<String>>(
      context: context,
      builder: (context) {
        return MultiSelectDialog(
          items: widget.items,
          selectedItems: _selectedValues,
        );
      },
    ) ?? [];

    if (selectedItems.isNotEmpty && selectedItems != _selectedValues) {
      setState(() {
        _selectedValues = selectedItems.cast<Product>();
      });
      if (widget.onChanged != null) {
        widget.onChanged!(_selectedValues.cast<String>());
      }
    }
  }
}

class MultiSelectDialog extends StatefulWidget {
  final List<Product> items;
  final List<Product> selectedItems;

  MultiSelectDialog({
    Key? key,
    required this.items,
    required this.selectedItems,
  }) : super(key: key);

  @override
  _MultiSelectDialogState createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<MultiSelectDialog> {
  late List<Product> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = List.from(widget.selectedItems); // Initialize selected items
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('اختر المنتجات'),
      content: SingleChildScrollView(
        child: Column(
          children: widget.items.map((Product product) {
            return CheckboxListTile(
              title: Text('${product.name} - ${product.prix1} د.ج'),
              value: _selectedItems.contains(product),
              onChanged: (bool? selected) {
                setState(() {
                  if (selected == true) {
                    _selectedItems.add(product);
                  } else {
                    _selectedItems.remove(product);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, _selectedItems); // Return selected products
          },
          child: Text('OK'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, widget.selectedItems); // Return original selection on cancel
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
