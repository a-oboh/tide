import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tide/core/domain/database/drawing_db.dart';
import 'package:tide/core/domain/models/tide_drawing.dart';
import 'dart:convert';

part 'database.g.dart';

@DriftDatabase(tables: [CanvasTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  Future<List<CanvasTableData>> getAllCanvases() => select(canvasTable).get();

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'tide_db');
  }
}

@riverpod
AppDatabase db(Ref ref) {
  return AppDatabase();
}
