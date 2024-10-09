import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tide/core/domain/models/tide_drawing.dart';
import 'package:tide/core/utils/colors.dart';
import 'package:tide/core/utils/extensions.dart';
import 'package:tide/view/notifier/tide_canvas_notifier.dart';
import 'package:tide/view/notifier/tide_paint_notifier.dart';
import 'package:tide/view/widgets/new_drawing_modal.dart';
import 'package:tide/view/widgets/saved_canvases_view_widget.dart';

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
          InkWell(
            onTap: () {
              ref.read(tideCanvasNotifierProvider.notifier).getSavedCanvases();
              showDialog(
                  context: context, builder: (ctx) => SavedCanvasesView());

            },
            child: Text('Open drawing'),
          ),
          10.height,
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
                DropdownMenuItem(
                  value: DrawingType.triangle,
                  child: Text('Triangle'),
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

class CanvasPageToolSection extends ConsumerWidget {
  const CanvasPageToolSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawingType = ref.watch(tidePaintNotifierProvider).drawingType;
    final tideDrawing = ref.watch(tideCanvasNotifierProvider).allDrawings;

    return Container(
      decoration: const BoxDecoration(color: TideColors.grey),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                ref.read(tideCanvasNotifierProvider.notifier).undoDrawing();
              },
              icon: const Icon(Icons.undo)),
          IconButton(
              onPressed: () {
                ref.read(tideCanvasNotifierProvider.notifier).redoDrawing();
              },
              icon: const Icon(Icons.redo)),
          5.width,
          Tooltip(
            message: 'Eraser',
            child: IconButton(
              onPressed: () {
                // activate eraser
                ref
                    .read(tidePaintNotifierProvider.notifier)
                    .setDrawingType(DrawingType.eraser);
              },
              icon: Icon(
                Icons.stay_current_landscape,
                color: drawingType == DrawingType.eraser
                    ? TideColors.primaryColor
                    : TideColors.iconGrey,
              ),
            ),
          ),
          Tooltip(
            message: 'Save',
            child: IconButton(
              onPressed: () async {
                final cacheExists = await ref
                    .read(tideCanvasNotifierProvider.notifier)
                    .cacheDrawingExists();

                if (cacheExists == false) {
                  showNewDrawingDialog(context);

                  print('no cache available');
                } else {
                  //update local
                  ref.read(tideCanvasNotifierProvider.notifier).saveDrawing(
                      drawingList:
                          ref.read(tideCanvasNotifierProvider).allDrawings);
                }
              },
              icon: Icon(
                Icons.save,
                color: TideColors.iconGrey,
              ),
            ),
          ),
          Tooltip(
            message: 'Color',
            child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: IntrinsicHeight(
                          child: ColorPicker(
                            pickerColor: ref
                                .watch(tidePaintNotifierProvider)
                                .pickerColor,
                            onColorChanged: (Color value) {
                              ref
                                  .read(tidePaintNotifierProvider.notifier)
                                  .setPaintColor(value);
                            },
                          ),
                        ),
                        actions: [
                          FilledButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Done'),
                          )
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.color_lens),
            ),
          )
        ],
      ),
    );
  }
}
