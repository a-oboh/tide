import 'dart:ui';

import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tide/core/domain/database/dao/canvas_dao.dart';
import 'package:tide/core/domain/database/database.dart';
import 'package:tide/core/domain/models/tide_drawing.dart';
import 'package:tide/core/services/prefs_service.dart';
import 'package:tide/core/utils/strings.dart';
import 'package:tide/view/canvas/notifier/state/tide_canvas_state.dart';

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
      var drawings = state.allDrawings.list;
      final newDrawings = [...drawings, drawing];

      state = state.copyWith(
          allDrawings: state.allDrawings.copyWith(list: newDrawings),
          currentDrawing: null);
    }
  }

  void undoDrawing() {
    if (state.allDrawings.list.isNotEmpty) {
      List<TideDrawing> allDrawings = [...state.allDrawings.list];
      var removed = allDrawings.removeLast();
      state = state.copyWith(
        allDrawings: state.allDrawings.copyWith(list: allDrawings),
        removedDrawing: removed,
        currentDrawing: null,
      );
    }
  }

  void redoDrawing() {
    if (state.removedDrawing != null) {
      TideDrawingList drawings = state.allDrawings;
      final newDrawings = [...drawings.list, state.removedDrawing!];

      state = state.copyWith(
        allDrawings: drawings.copyWith(list: newDrawings),
        removedDrawing: null,
      );
    }
  }

  Future<bool> cacheDrawingExists() async {
    final cacheProvider = ref.read(prefsServiceProvider);
    final cachedDrawingId =
        await cacheProvider.getInt(AppStrings.cachedDrawingKey);

    state = state.copyWith(cachedDrawing: cachedDrawingId);

    return cachedDrawingId != null;
  }

  onDrawingTitleChanged() {}

  Future<void> createNewEntry(
      String title, TideDrawing? drawing, TideDrawingList? drawingList) async {
    try {
      state = state.copyWith(
        saveNewCanvasError: false,
        loadingCanvas: true,
        newDrawingSaved: false,
      );

      final canvasDao = ref.read(canvasDaoProvider);
      final cacheProvider = ref.read(prefsServiceProvider);

      final row = await canvasDao.createDrawing(
          title: title,
          drawing: drawing ?? TideDrawing(paint: Paint()),
          drawingList: TideDrawingList());
      await cacheProvider.saveInt(AppStrings.cachedDrawingKey, row);

      state = state.copyWith(
          cachedDrawing: row, loadingCanvas: false, newDrawingSaved: true);
    } catch (e) {
      state = state.copyWith(
          saveNewCanvasError: true,
          loadingCanvas: false,
          newDrawingSaved: false);
    }
  }

  Future<void> saveDrawing(
      {TideDrawing? drawing, required TideDrawingList drawingList}) async {
    try {
      state = state.copyWith(loadingCanvas: true);
      final db = ref.read(dbProvider);
      final int? cachedDrawingId = state.cachedDrawing;

      if (cachedDrawingId != null) {
        final canvasDao = ref.read(canvasDaoProvider);

        // update drawing
        await canvasDao.updateDrawing(
            id: cachedDrawingId,
            drawing: drawing ?? drawingList.list.last,
            drawingList: drawingList);

        state = state.copyWith(
          loadingCanvas: false,
          updatedLocalDrawing: true,
        );
      }
    } catch (e) {
      state = state.copyWith(
        loadingCanvas: false,
        saveNewCanvasError: true,
        updateLocalDrawingError: true,
      );
    }
  }

  /// All saved canvases
  Future<void> getSavedCanvases() async {
    state = state.copyWith(loadingSavedCanvases: true);
    final dao = ref.read(canvasDaoProvider);
    final List<CanvasTableData> canvases = await dao.getAllDrawings();

    state =
        state.copyWith(savedCanvases: canvases, loadingSavedCanvases: false);
  }

  /// Get canvas from ID saved in shared_prefs
  Future<void> getCachedCanvas() async {
    final dao = ref.read(canvasDaoProvider);
    final cachedCanvasExists = await cacheDrawingExists();

    if (cachedCanvasExists) {
      final id = state.cachedDrawing;
      if (id != null) {
        final CanvasTableData data = await dao.getSingleDrawing(id: id);
        // state = state.copyWith(allDrawings: data.);
      }
    }
  }

  void loadCurrentDrawingData({
    required TideDrawing currentDrawing,
    required TideDrawingList drawingList,
    required int drawingId,
  }) {
    state = state.copyWith(
        currentDrawing: currentDrawing,
        allDrawings: drawingList,
        cachedDrawing: drawingId);
  }
}
