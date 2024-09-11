import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tide/core/domain/models/tide_canvas.dart';
import 'package:tide/view/notifier/tide_paint_notifier.dart';

class CanvasSettingsWidget extends ConsumerStatefulWidget {
  const CanvasSettingsWidget({super.key});

  @override
  ConsumerState<CanvasSettingsWidget> createState() =>
      _CanvasSettingsWidgetState();
}

class _CanvasSettingsWidgetState extends ConsumerState<CanvasSettingsWidget> {
  String? colorDropDownVal = 'black';
  DrawingType? pathTypeValue = DrawingType.path;

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
              ref.read(tidePaintNotifierProvider.notifier).setPaintColor(color);
              setState(() {
                colorDropDownVal = val;
              });
            },
          ),
          DropdownButton<DrawingType>(
              value: pathTypeValue,
              items: const [
                DropdownMenuItem(
                  value: DrawingType.path,
                  child: Text('Path'),
                ),
                DropdownMenuItem(
                  value: DrawingType.rectangle,
                  child: Text('Rectangle'),
                ),
                DropdownMenuItem(
                  value: DrawingType.oval,
                  child: Text('Oval'),
                ),
              ],
              onChanged: (val) {
                if (val != null) {
                  ref
                      .read(tidePaintNotifierProvider.notifier)
                      .setDrawingType(val);
                  setState(() {
                    pathTypeValue = val;
                  });
                }
              }),
        ],
      ),
    );
  }
}
