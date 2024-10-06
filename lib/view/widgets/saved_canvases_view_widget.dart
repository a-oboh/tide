import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tide/core/domain/database/database.dart';
import 'package:tide/view/notifier/tide_canvas_notifier.dart';

class SavedCanvasesView extends ConsumerWidget {
  const SavedCanvasesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tideCanvasState = ref.watch(tideCanvasNotifierProvider);
    return tideCanvasState.loadingSavedCanvases
        ? Center(
            child: CircularProgressIndicator(),
          )
        : buildSavedCanvasList(tideCanvasState.savedCanvases);
  }

  buildSavedCanvasList(List<CanvasTableData> savedCanvases) {
    if (savedCanvases.isEmpty) {
      return Center(
          child: Text(
        'No saved drawings',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ));
    }
    return Column(
      children: savedCanvases
          .map((canvas) => ListTile(
                title: Text(canvas.title),
              ))
          .toList(),
    );
  }
}
