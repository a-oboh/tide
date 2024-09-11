import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tide/core/domain/models/tide_canvas.dart';

part 'tide_paint_state.freezed.dart';

@freezed
class TidePaintState with _$TidePaintState {
  const factory TidePaintState({
    required Paint paint,
    @Default(DrawingType.path) DrawingType drawingType,
  }) = _TidePaintState;
}
