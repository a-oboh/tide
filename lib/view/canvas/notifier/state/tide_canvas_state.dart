import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tide/core/domain/models/tide_canvas.dart';
part 'tide_canvas_state.freezed.dart';

@freezed
class TideCanvasState with _$TideCanvasState {
  const factory TideCanvasState({required Paint paint, TideCanvas? currentDrawing, List<TideCanvas>? allDrawings}) = _TideCanvasState;
}
