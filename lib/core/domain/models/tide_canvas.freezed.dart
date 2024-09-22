// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tide_canvas.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TideDrawing _$TideDrawingFromJson(Map<String, dynamic> json) {
  return _TideDrawing.fromJson(json);
}

/// @nodoc
mixin _$TideDrawing {
  @OffsetConverter()
  List<Offset> get currentDrawing => throw _privateConstructorUsedError;
  @OffsetConverter()
  List<List<Offset>>? get allDrawings => throw _privateConstructorUsedError;
  @PaintConverter()
  Paint get paint => throw _privateConstructorUsedError;
  DrawingType get drawingType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TideDrawingCopyWith<TideDrawing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TideDrawingCopyWith<$Res> {
  factory $TideDrawingCopyWith(
          TideDrawing value, $Res Function(TideDrawing) then) =
      _$TideDrawingCopyWithImpl<$Res, TideDrawing>;
  @useResult
  $Res call(
      {@OffsetConverter() List<Offset> currentDrawing,
      @OffsetConverter() List<List<Offset>>? allDrawings,
      @PaintConverter() Paint paint,
      DrawingType drawingType});
}

/// @nodoc
class _$TideDrawingCopyWithImpl<$Res, $Val extends TideDrawing>
    implements $TideDrawingCopyWith<$Res> {
  _$TideDrawingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentDrawing = null,
    Object? allDrawings = freezed,
    Object? paint = null,
    Object? drawingType = null,
  }) {
    return _then(_value.copyWith(
      currentDrawing: null == currentDrawing
          ? _value.currentDrawing
          : currentDrawing // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
      allDrawings: freezed == allDrawings
          ? _value.allDrawings
          : allDrawings // ignore: cast_nullable_to_non_nullable
              as List<List<Offset>>?,
      paint: null == paint
          ? _value.paint
          : paint // ignore: cast_nullable_to_non_nullable
              as Paint,
      drawingType: null == drawingType
          ? _value.drawingType
          : drawingType // ignore: cast_nullable_to_non_nullable
              as DrawingType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TideDrawingImplCopyWith<$Res>
    implements $TideDrawingCopyWith<$Res> {
  factory _$$TideDrawingImplCopyWith(
          _$TideDrawingImpl value, $Res Function(_$TideDrawingImpl) then) =
      __$$TideDrawingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@OffsetConverter() List<Offset> currentDrawing,
      @OffsetConverter() List<List<Offset>>? allDrawings,
      @PaintConverter() Paint paint,
      DrawingType drawingType});
}

/// @nodoc
class __$$TideDrawingImplCopyWithImpl<$Res>
    extends _$TideDrawingCopyWithImpl<$Res, _$TideDrawingImpl>
    implements _$$TideDrawingImplCopyWith<$Res> {
  __$$TideDrawingImplCopyWithImpl(
      _$TideDrawingImpl _value, $Res Function(_$TideDrawingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentDrawing = null,
    Object? allDrawings = freezed,
    Object? paint = null,
    Object? drawingType = null,
  }) {
    return _then(_$TideDrawingImpl(
      currentDrawing: null == currentDrawing
          ? _value._currentDrawing
          : currentDrawing // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
      allDrawings: freezed == allDrawings
          ? _value._allDrawings
          : allDrawings // ignore: cast_nullable_to_non_nullable
              as List<List<Offset>>?,
      paint: null == paint
          ? _value.paint
          : paint // ignore: cast_nullable_to_non_nullable
              as Paint,
      drawingType: null == drawingType
          ? _value.drawingType
          : drawingType // ignore: cast_nullable_to_non_nullable
              as DrawingType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TideDrawingImpl implements _TideDrawing {
  const _$TideDrawingImpl(
      {@OffsetConverter() final List<Offset> currentDrawing = const [],
      @OffsetConverter() final List<List<Offset>>? allDrawings = const [],
      @PaintConverter() required this.paint,
      this.drawingType = DrawingType.path})
      : _currentDrawing = currentDrawing,
        _allDrawings = allDrawings;

  factory _$TideDrawingImpl.fromJson(Map<String, dynamic> json) =>
      _$$TideDrawingImplFromJson(json);

  final List<Offset> _currentDrawing;
  @override
  @JsonKey()
  @OffsetConverter()
  List<Offset> get currentDrawing {
    if (_currentDrawing is EqualUnmodifiableListView) return _currentDrawing;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentDrawing);
  }

  final List<List<Offset>>? _allDrawings;
  @override
  @JsonKey()
  @OffsetConverter()
  List<List<Offset>>? get allDrawings {
    final value = _allDrawings;
    if (value == null) return null;
    if (_allDrawings is EqualUnmodifiableListView) return _allDrawings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @PaintConverter()
  final Paint paint;
  @override
  @JsonKey()
  final DrawingType drawingType;

  @override
  String toString() {
    return 'TideDrawing(currentDrawing: $currentDrawing, allDrawings: $allDrawings, paint: $paint, drawingType: $drawingType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TideDrawingImpl &&
            const DeepCollectionEquality()
                .equals(other._currentDrawing, _currentDrawing) &&
            const DeepCollectionEquality()
                .equals(other._allDrawings, _allDrawings) &&
            (identical(other.paint, paint) || other.paint == paint) &&
            (identical(other.drawingType, drawingType) ||
                other.drawingType == drawingType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_currentDrawing),
      const DeepCollectionEquality().hash(_allDrawings),
      paint,
      drawingType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TideDrawingImplCopyWith<_$TideDrawingImpl> get copyWith =>
      __$$TideDrawingImplCopyWithImpl<_$TideDrawingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TideDrawingImplToJson(
      this,
    );
  }
}

abstract class _TideDrawing implements TideDrawing {
  const factory _TideDrawing(
      {@OffsetConverter() final List<Offset> currentDrawing,
      @OffsetConverter() final List<List<Offset>>? allDrawings,
      @PaintConverter() required final Paint paint,
      final DrawingType drawingType}) = _$TideDrawingImpl;

  factory _TideDrawing.fromJson(Map<String, dynamic> json) =
      _$TideDrawingImpl.fromJson;

  @override
  @OffsetConverter()
  List<Offset> get currentDrawing;
  @override
  @OffsetConverter()
  List<List<Offset>>? get allDrawings;
  @override
  @PaintConverter()
  Paint get paint;
  @override
  DrawingType get drawingType;
  @override
  @JsonKey(ignore: true)
  _$$TideDrawingImplCopyWith<_$TideDrawingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
