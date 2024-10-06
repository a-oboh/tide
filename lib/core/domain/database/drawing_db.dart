import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:tide/core/domain/models/tide_drawing.dart';
import 'dart:convert';

class CanvasTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get drawing => text().map(const DrawingConverter())();

  TextColumn get drawingList => text().map(const DrawingListConverter())();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

class DrawingConverter extends TypeConverter<TideDrawing, String> {
  const DrawingConverter();

  @override
  TideDrawing fromSql(String fromDb) {
    return TideDrawing.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(TideDrawing value) {
    return json.encode(value.toJson());
  }
}

class DrawingListConverter extends TypeConverter<TideDrawingList, String> {
  const DrawingListConverter();

  @override
  TideDrawingList fromSql(String fromDb) {
    return TideDrawingList.fromJson(
        json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(TideDrawingList value) {
   return jsonEncode(value.toJson());
  }
}
