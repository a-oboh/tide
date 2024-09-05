import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tide/core/domain/models/tide_canvas.dart';
import 'package:tide/view/canvas/notifier/state/tide_canvas_state.dart';

part 'tide_canvas_notifier.g.dart';

@riverpod
class TideCanvasNotifier extends _$TideCanvasNotifier {
  @override
  TideCanvasState build() {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    return TideCanvasState(paint: paint);
  }

  void setCurrentDrawing(TideDrawing tideDrawing) {
    state = state.copyWith(currentDrawing: tideDrawing);
  }

  void updateCurrentDrawing(TideDrawing? drawing) {
    state = state.copyWith(currentDrawing: drawing);
  }

  void addToDrawings(TideDrawing? drawing) {
    if (drawing != null) {
      var drawings = state.allDrawings;
      final newDrawings = [...drawings, drawing];

      state = state.copyWith(allDrawings: newDrawings);
    }
  }

  void setPaintColor(Color color) {
    var paint = state.paint;

    paint.color = color;

    state = state.copyWith(paint: paint);
  }
}
