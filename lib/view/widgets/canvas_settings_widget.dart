import 'package:flutter/material.dart';

class CanvasSettingsWidget extends StatefulWidget {
  const CanvasSettingsWidget({super.key});

  @override
  State<CanvasSettingsWidget> createState() => _CanvasSettingsWidgetState();
}

class _CanvasSettingsWidgetState extends State<CanvasSettingsWidget> {
  String? colorDropDownVal = 'black';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DropdownButton<String>(
            items: const [
              DropdownMenuItem(value: 'black', child: Text('black')),
              DropdownMenuItem(value: 'red', child: Text('red')),
              DropdownMenuItem(value: 'green', child: Text('green'))
            ],
            value: colorDropDownVal,
            onChanged: (val) {
              setState(() {
                colorDropDownVal = val;
              });
            },
          )
        ],
      ),
    );
  }
}
