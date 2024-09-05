import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tide/view/canvas/notifier/tide_canvas_notifier.dart';

class CanvasSettingsWidget extends ConsumerStatefulWidget {
  const CanvasSettingsWidget({super.key});

  @override
  ConsumerState<CanvasSettingsWidget> createState() =>
      _CanvasSettingsWidgetState();
}

class _CanvasSettingsWidgetState extends ConsumerState<CanvasSettingsWidget> {
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
              late Color color;

              switch (val) {
                case 'red':
                  color = Colors.red;
                  break;
                case 'green':
                  color = Colors.green;
                default:
                  color = Colors.black;
              }
              ref
                  .read(tideCanvasNotifierProvider.notifier)
                  .setPaintColor(color);
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
