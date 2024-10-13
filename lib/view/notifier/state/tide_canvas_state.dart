import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tide/core/domain/database/database.dart';
import 'package:tide/core/domain/models/tide_drawing.dart';

part 'tide_canvas_state.freezed.dart';

@freezed
class TideCanvasState with _$TideCanvasState {
  const factory TideCanvasState({
    TideDrawing? currentDrawing,
    TideDrawing? removedDrawing,
    int? cachedDrawing,
    @Default(TideDrawingList()) TideDrawingList allDrawings,
    @Default(false) bool loadingSavedCanvases,
    @Default(false) bool loadingCanvas,
    @Default(false) bool saveNewCanvasError,
    @Default(false) bool newDrawingSaved,
    @Default(false) bool updatedLocalDrawing,
    @Default(false) bool updateLocalDrawingError,
    @Default([]) List<CanvasTableData> savedCanvases,
  }) = _TideCanvasState;
}
