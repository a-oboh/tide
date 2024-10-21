import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tide/core/domain/database/database.dart';
import 'package:tide/core/domain/database/drawing_db.dart';
import 'package:tide/core/domain/models/tide_drawing.dart';

part 'canvas_dao.g.dart';

@DriftAccessor(tables: [CanvasTable])
class CanvasDao extends DatabaseAccessor<AppDatabase> with _$DrawingDaoMixin {
  CanvasDao(db) : super(db);

  Future<int> createDrawing(
      {required String title,
      required TideDrawing drawing,
      required TideDrawingList drawingList}) async {
    try {
      final canvasCompanion = CanvasTableCompanion(
        title: Value(title),
        drawing: Value(drawing),
        drawingList: Value(drawingList),
      );

      return into(canvasTable).insertOnConflictUpdate(canvasCompanion);
    } catch (e) {
      rethrow;
    }
  }

  Future<int> updateDrawing(
      {required int id,
      required TideDrawing drawing,
      required TideDrawingList drawingList}) async {
    try {
      final companion = CanvasTableCompanion(
          drawingList: Value(drawingList),
          drawing: Value(
            drawing,
          ));

      //update drawing
      return (update(canvasTable)..where((d) => d.id.equals(id)))
          .write(companion);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CanvasTableData>> getAllDrawings() async {
    try {
      return select(canvasTable).get();
    } catch (e) {
      rethrow;
    }
  }

  Future<CanvasTableData> getSingleDrawing({required int id}) async {
    try {
      return (select(canvasTable)..where((t) => t.id.equals(id)))
          .getSingle();
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
CanvasDao canvasDao(DrawingDaoRef ref){
return CanvasDao( ref.read(dbProvider));
}
