import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tide/core/domain/models/tide_canvas.dart';
import 'package:tide/view/notifier/state/tide_paint_state.dart';

part 'tide_paint_notifier.g.dart';

@riverpod
class TidePaintNotifier extends _$TidePaintNotifier {
  @override
  TidePaintState build() {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    var eraserPaint = Paint()
      ..color = Colors.white
      ..style = paint.style
      ..strokeWidth = paint.strokeWidth;

    return TidePaintState(
      paint: paint,
      eraserPaint: eraserPaint,
    );
  }

  void setPaintColor(Color color) {
    var paint = state.paint;

    if (state.drawingType == DrawingType.eraser) {
      return;
    }

    state = state.copyWith(
      paint: Paint()
        ..color = color
        ..style = paint.style
        ..strokeWidth = paint.strokeWidth,
    );
  }

  void setDrawingType(DrawingType type) {
    if (state.drawingType != type) {
      state = state.copyWith(drawingType: type);
    }
  }
}
