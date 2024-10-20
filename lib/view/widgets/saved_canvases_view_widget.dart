import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tide/core/domain/database/database.dart';
import 'package:tide/core/utils/extensions.dart';
import 'package:tide/view/notifier/tide_canvas_notifier.dart';

class SavedCanvasesView extends ConsumerWidget {
  const SavedCanvasesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tideCanvasState = ref.watch(tideCanvasNotifierProvider);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 40, vertical: context.height * 0.1),
      child: AlertDialog(
        content: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.close),
              ),
            ),
            if (tideCanvasState.loadingSavedCanvases)
              Center(
                child: CircularProgressIndicator(),
              )
            else ...[
              Expanded(
                child: buildSavedCanvasList(
                  savedCanvases: tideCanvasState.savedCanvases,
                  ref: ref,
                  context: context,
                ),
              )
            ],
          ],
        ),
      ),
    );
  }

  buildSavedCanvasList(
      {required List<CanvasTableData> savedCanvases,
      required WidgetRef ref,
      required BuildContext context}) {
    if (savedCanvases.isEmpty) {
      return const Center(
          child: Text(
        'No saved drawings',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ));
    }
    return SingleChildScrollView(
      child: Column(
        children: savedCanvases
            .map((canvas) => ListTile(
                  onTap: () {
                    ref
                        .read(tideCanvasNotifierProvider.notifier)
                        .loadCurrentDrawingData(
                          currentDrawing: canvas.drawing,
                          drawingList: canvas.drawingList,
                          drawingId: canvas.id,
                        );

                    Navigator.of(context).pop();
                  },
                  title: Text(canvas.title),
                ))
            .toList(),
      ),
    );
  }
}
