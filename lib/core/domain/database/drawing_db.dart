import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:tide/core/domain/models/tide_canvas.dart';
import 'dart:convert';

class CanvasTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get drawing => text().map(const DrawingConverter())();

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
