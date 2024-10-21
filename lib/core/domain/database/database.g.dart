// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CanvasTableTable extends CanvasTable
    with TableInfo<$CanvasTableTable, CanvasTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CanvasTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _drawingMeta =
      const VerificationMeta('drawing');
  @override
  late final GeneratedColumnWithTypeConverter<TideDrawing, String> drawing =
      GeneratedColumn<String>('drawing', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TideDrawing>($CanvasTableTable.$converterdrawing);
  static const VerificationMeta _drawingListMeta =
      const VerificationMeta('drawingList');
  @override
  late final GeneratedColumnWithTypeConverter<TideDrawingList, String>
      drawingList = GeneratedColumn<String>('drawing_list', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<TideDrawingList>(
              $CanvasTableTable.$converterdrawingList);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, drawing, drawingList, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'canvas_table';
  @override
  VerificationContext validateIntegrity(Insertable<CanvasTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    context.handle(_drawingMeta, const VerificationResult.success());
    context.handle(_drawingListMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CanvasTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CanvasTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      drawing: $CanvasTableTable.$converterdrawing.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}drawing'])!),
      drawingList: $CanvasTableTable.$converterdrawingList.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}drawing_list'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $CanvasTableTable createAlias(String alias) {
    return $CanvasTableTable(attachedDatabase, alias);
  }

  static TypeConverter<TideDrawing, String> $converterdrawing =
      const DrawingConverter();
  static TypeConverter<TideDrawingList, String> $converterdrawingList =
      const DrawingListConverter();
}

class CanvasTableData extends DataClass implements Insertable<CanvasTableData> {
  final int id;
  final String title;
  final TideDrawing drawing;
  final TideDrawingList drawingList;
  final DateTime createdAt;
  const CanvasTableData(
      {required this.id,
      required this.title,
      required this.drawing,
      required this.drawingList,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    {
      map['drawing'] =
          Variable<String>($CanvasTableTable.$converterdrawing.toSql(drawing));
    }
    {
      map['drawing_list'] = Variable<String>(
          $CanvasTableTable.$converterdrawingList.toSql(drawingList));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CanvasTableCompanion toCompanion(bool nullToAbsent) {
    return CanvasTableCompanion(
      id: Value(id),
      title: Value(title),
      drawing: Value(drawing),
      drawingList: Value(drawingList),
      createdAt: Value(createdAt),
    );
  }

  factory CanvasTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CanvasTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      drawing: serializer.fromJson<TideDrawing>(json['drawing']),
      drawingList: serializer.fromJson<TideDrawingList>(json['drawingList']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'drawing': serializer.toJson<TideDrawing>(drawing),
      'drawingList': serializer.toJson<TideDrawingList>(drawingList),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CanvasTableData copyWith(
          {int? id,
          String? title,
          TideDrawing? drawing,
          TideDrawingList? drawingList,
          DateTime? createdAt}) =>
      CanvasTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        drawing: drawing ?? this.drawing,
        drawingList: drawingList ?? this.drawingList,
        createdAt: createdAt ?? this.createdAt,
      );
  CanvasTableData copyWithCompanion(CanvasTableCompanion data) {
    return CanvasTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      drawing: data.drawing.present ? data.drawing.value : this.drawing,
      drawingList:
          data.drawingList.present ? data.drawingList.value : this.drawingList,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CanvasTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('drawing: $drawing, ')
          ..write('drawingList: $drawingList, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, drawing, drawingList, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CanvasTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.drawing == this.drawing &&
          other.drawingList == this.drawingList &&
          other.createdAt == this.createdAt);
}

class CanvasTableCompanion extends UpdateCompanion<CanvasTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<TideDrawing> drawing;
  final Value<TideDrawingList> drawingList;
  final Value<DateTime> createdAt;
  const CanvasTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.drawing = const Value.absent(),
    this.drawingList = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CanvasTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required TideDrawing drawing,
    required TideDrawingList drawingList,
    this.createdAt = const Value.absent(),
  })  : title = Value(title),
        drawing = Value(drawing),
        drawingList = Value(drawingList);
  static Insertable<CanvasTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? drawing,
    Expression<String>? drawingList,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (drawing != null) 'drawing': drawing,
      if (drawingList != null) 'drawing_list': drawingList,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CanvasTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<TideDrawing>? drawing,
      Value<TideDrawingList>? drawingList,
      Value<DateTime>? createdAt}) {
    return CanvasTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      drawing: drawing ?? this.drawing,
      drawingList: drawingList ?? this.drawingList,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (drawing.present) {
      map['drawing'] = Variable<String>(
          $CanvasTableTable.$converterdrawing.toSql(drawing.value));
    }
    if (drawingList.present) {
      map['drawing_list'] = Variable<String>(
          $CanvasTableTable.$converterdrawingList.toSql(drawingList.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CanvasTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('drawing: $drawing, ')
          ..write('drawingList: $drawingList, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CanvasTableTable canvasTable = $CanvasTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [canvasTable];
}

typedef $$CanvasTableTableCreateCompanionBuilder = CanvasTableCompanion
    Function({
  Value<int> id,
  required String title,
  required TideDrawing drawing,
  required TideDrawingList drawingList,
  Value<DateTime> createdAt,
});
typedef $$CanvasTableTableUpdateCompanionBuilder = CanvasTableCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<TideDrawing> drawing,
  Value<TideDrawingList> drawingList,
  Value<DateTime> createdAt,
});

class $$CanvasTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CanvasTableTable> {
  $$CanvasTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<TideDrawing, TideDrawing, String>
      get drawing => $state.composableBuilder(
          column: $state.table.drawing,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<TideDrawingList, TideDrawingList, String>
      get drawingList => $state.composableBuilder(
          column: $state.table.drawingList,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CanvasTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CanvasTableTable> {
  $$CanvasTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get drawing => $state.composableBuilder(
      column: $state.table.drawing,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get drawingList => $state.composableBuilder(
      column: $state.table.drawingList,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$CanvasTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CanvasTableTable,
    CanvasTableData,
    $$CanvasTableTableFilterComposer,
    $$CanvasTableTableOrderingComposer,
    $$CanvasTableTableCreateCompanionBuilder,
    $$CanvasTableTableUpdateCompanionBuilder,
    (
      CanvasTableData,
      BaseReferences<_$AppDatabase, $CanvasTableTable, CanvasTableData>
    ),
    CanvasTableData,
    PrefetchHooks Function()> {
  $$CanvasTableTableTableManager(_$AppDatabase db, $CanvasTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CanvasTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CanvasTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<TideDrawing> drawing = const Value.absent(),
            Value<TideDrawingList> drawingList = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              CanvasTableCompanion(
            id: id,
            title: title,
            drawing: drawing,
            drawingList: drawingList,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required TideDrawing drawing,
            required TideDrawingList drawingList,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              CanvasTableCompanion.insert(
            id: id,
            title: title,
            drawing: drawing,
            drawingList: drawingList,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CanvasTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CanvasTableTable,
    CanvasTableData,
    $$CanvasTableTableFilterComposer,
    $$CanvasTableTableOrderingComposer,
    $$CanvasTableTableCreateCompanionBuilder,
    $$CanvasTableTableUpdateCompanionBuilder,
    (
      CanvasTableData,
      BaseReferences<_$AppDatabase, $CanvasTableTable, CanvasTableData>
    ),
    CanvasTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CanvasTableTableTableManager get canvasTable =>
      $$CanvasTableTableTableManager(_db, _db.canvasTable);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dbHash() => r'5318c967f76c866e5afd6c96b01cbab4e914ba30';

/// See also [db].
@ProviderFor(db)
final dbProvider = AutoDisposeProvider<AppDatabase>.internal(
  db,
  name: r'dbProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DbRef = AutoDisposeProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
