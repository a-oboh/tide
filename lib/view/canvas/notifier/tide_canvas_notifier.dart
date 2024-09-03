import 'package:flutter/material.dart';
import 'package:tide/core/domain/models/tide_canvas.dart';
import 'package:tide/view/canvas/notifier/state/tide_canvas_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tide_canvas_notifier.g.dart';

@riverpod
class TideCanvasNotifier extends _$TideCanvasNotifier {
  @override
  TideCanvasState build() {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    return TideCanvasState(paint: paint);
  }

  void setCurrentDrawing(TideCanvas tideCanvas) {
    state = state.copyWith(currentDrawing: tideCanvas);
  }

  void addToDrawings(TideCanvas tideCanvas) {
    var drawings = state.allDrawings;

    drawings?.add(tideCanvas);

    state = state.copyWith(allDrawings: drawings);
  }
}
