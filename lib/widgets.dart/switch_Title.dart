import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool action;
  final String label;

   CustomSwitch({
    Key? key,
    required this.action,
    required this.label,
  }) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool _currentAction;

  @override
  void initState() {
    super.initState();
    _currentAction = widget.action; // Initialize the current state of the switch
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.label),
      value: _currentAction,
      onChanged: (bool value) {
        setState(() {
          _currentAction = value; // Update the state of the switch
        });
      },
    )
  ;}
}
