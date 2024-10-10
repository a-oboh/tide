import 'dart:ui';

import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tide/core/domain/database/database.dart';
import 'package:tide/core/domain/models/tide_drawing.dart';
import 'package:tide/core/services/prefs_service.dart';
import 'package:tide/core/utils/strings.dart';
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

  onDrawingTitleChnaged() {}

  Future<void> createNewEntry(
      String title, TideDrawing? drawing, TideDrawingList? drawingList) async {
    try {
      state = state.copyWith(
        saveNewCanvasError: false,
        loadingCanvas: true,
        newDrawingSaved: false,
      );

      final db = ref.read(dbProvider);
      final cacheProvider = ref.read(prefsServiceProvider);
      final canvasCompanion = CanvasTableCompanion(
          title: Value(title),
          drawing: Value(drawing ?? TideDrawing(paint: Paint())),
          drawingList: Value(TideDrawingList()));
      final row =
          await db.into(db.canvasTable).insertOnConflictUpdate(canvasCompanion);
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
        final companion = CanvasTableCompanion(
            drawingList: Value(drawingList),
            drawing: Value(
              drawing ?? drawingList.list.last,
            ));

        //update drawing
        await (db.update(db.canvasTable)
              ..where((d) => d.id.equals(cachedDrawingId)))
            .write(companion);

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
    final db = ref.read(dbProvider);
    final List<CanvasTableData> canvases = await db.getAllCanvases();

    state =
        state.copyWith(savedCanvases: canvases, loadingSavedCanvases: false);
  }

  /// Get canvas from ID saved in shared_prefs
  Future<void> getCachedCanvas() async {
    final db = ref.read(dbProvider);
    final cachedCanvasExists = await cacheDrawingExists();

    if (cachedCanvasExists) {
      final id = state.cachedDrawing;
      if (id != null) {
        final stream = await (db.select(db.canvasTable)
              ..where((t) => t.id.equals(id)))
            .watchSingle();
        final data = await stream.first;
        // state = state.copyWith(allDrawings: data.);
      }
    }
  }

  void loadCurrentDrawingData(
      {required TideDrawing currentDrawing,
      required TideDrawingList drawingList}) {
    state = state.copyWith(
        currentDrawing: currentDrawing, allDrawings: drawingList);
  }
}
