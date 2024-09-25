import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tide/core/domain/models/tide_drawing.dart';

part 'tide_paint_state.freezed.dart';

@freezed
class TidePaintState with _$TidePaintState {
  const factory TidePaintState({
    required Paint paint,
    required Paint eraserPaint,
    @Default(Colors.black) Color pickerColor,
    @Default(DrawingType.path) DrawingType drawingType,
    @Default(DrawingType.path) DrawingType previousDrawingType,
  }) = _TidePaintState;
}
