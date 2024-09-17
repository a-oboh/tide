import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tide/core/domain/models/tide_canvas.dart';
import 'package:tide/view/notifier/state/tide_canvas_state.dart';

part 'tide_canvas_notifier.g.dart';

@riverpod
class TideCanvasNotifier extends _$TideCanvasNotifier {
  @override
  TideCanvasState build() {
    return const TideCanvasState();
  }

  void setCurrentDrawing(TideDrawing tideDrawing) {
    state = state.copyWith(currentDrawing: tideDrawing, removedDrawing: null);
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

  void undoDrawing() {
    if (state.allDrawings.isNotEmpty) {
      var allDrawings = [...state.allDrawings];
      var removed = allDrawings.removeLast();
      state = state.copyWith(
        allDrawings: allDrawings,
        removedDrawing: removed,
        currentDrawing: null,
      );
    }
  }

  void redoDrawing() {
    if (state.removedDrawing != null) {
      var drawings = state.allDrawings;
      final newDrawings = [...drawings, state.removedDrawing!];

      state = state.copyWith(
        allDrawings: newDrawings,
        removedDrawing: null,
      );
    }
  }
}
