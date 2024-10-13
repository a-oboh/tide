import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tide/core/domain/models/tide_drawing.dart';
import 'package:tide/core/utils/colors.dart';
import 'package:tide/view/canvas/notifier/state/tide_paint_state.dart';

part 'tide_paint_notifier.g.dart';

@riverpod
class TidePaintNotifier extends _$TidePaintNotifier {
  @override
  TidePaintState build() {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    var eraserPaint = Paint()
      ..color = TideColors.scaffoldBg
      ..style = paint.style
      ..strokeWidth = paint.strokeWidth;

    return TidePaintState(
      paint: paint,
      eraserPaint: eraserPaint,
    );
  }

  void setPaintColor(Color color) {
    var paint = state.paint;

    if (state.drawingType != DrawingType.eraser) {
      state = state.copyWith(
        paint: Paint()
          ..color = color
          ..style = paint.style
          ..strokeWidth = paint.strokeWidth + 5,
        pickerColor: color,
      );
    }
  }

  void setDrawingType(DrawingType type) {
    late DrawingType previousType;
    if (state.drawingType != type) {
      previousType = state.drawingType;
      state = state.copyWith(drawingType: type);
      if (type == DrawingType.eraser) {
        state = state.copyWith(previousDrawingType: previousType);
      }
    } else if (type == DrawingType.eraser) {
      // undo eraser selection
      state = state.copyWith(drawingType: state.previousDrawingType);
    }
  }
}
