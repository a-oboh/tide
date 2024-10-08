// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tide_paint_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TidePaintState {
  Paint get paint => throw _privateConstructorUsedError;
  Paint get eraserPaint => throw _privateConstructorUsedError;
  Color get pickerColor => throw _privateConstructorUsedError;
  DrawingType get drawingType => throw _privateConstructorUsedError;
  DrawingType get previousDrawingType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TidePaintStateCopyWith<TidePaintState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TidePaintStateCopyWith<$Res> {
  factory $TidePaintStateCopyWith(
          TidePaintState value, $Res Function(TidePaintState) then) =
      _$TidePaintStateCopyWithImpl<$Res, TidePaintState>;
  @useResult
  $Res call(
      {Paint paint,
      Paint eraserPaint,
      Color pickerColor,
      DrawingType drawingType,
      DrawingType previousDrawingType});
}

/// @nodoc
class _$TidePaintStateCopyWithImpl<$Res, $Val extends TidePaintState>
    implements $TidePaintStateCopyWith<$Res> {
  _$TidePaintStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paint = null,
    Object? eraserPaint = null,
    Object? pickerColor = null,
    Object? drawingType = null,
    Object? previousDrawingType = null,
  }) {
    return _then(_value.copyWith(
      paint: null == paint
          ? _value.paint
          : paint // ignore: cast_nullable_to_non_nullable
              as Paint,
      eraserPaint: null == eraserPaint
          ? _value.eraserPaint
          : eraserPaint // ignore: cast_nullable_to_non_nullable
              as Paint,
      pickerColor: null == pickerColor
          ? _value.pickerColor
          : pickerColor // ignore: cast_nullable_to_non_nullable
              as Color,
      drawingType: null == drawingType
          ? _value.drawingType
          : drawingType // ignore: cast_nullable_to_non_nullable
              as DrawingType,
      previousDrawingType: null == previousDrawingType
          ? _value.previousDrawingType
          : previousDrawingType // ignore: cast_nullable_to_non_nullable
              as DrawingType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TidePaintStateImplCopyWith<$Res>
    implements $TidePaintStateCopyWith<$Res> {
  factory _$$TidePaintStateImplCopyWith(_$TidePaintStateImpl value,
          $Res Function(_$TidePaintStateImpl) then) =
      __$$TidePaintStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Paint paint,
      Paint eraserPaint,
      Color pickerColor,
      DrawingType drawingType,
      DrawingType previousDrawingType});
}

/// @nodoc
class __$$TidePaintStateImplCopyWithImpl<$Res>
    extends _$TidePaintStateCopyWithImpl<$Res, _$TidePaintStateImpl>
    implements _$$TidePaintStateImplCopyWith<$Res> {
  __$$TidePaintStateImplCopyWithImpl(
      _$TidePaintStateImpl _value, $Res Function(_$TidePaintStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paint = null,
    Object? eraserPaint = null,
    Object? pickerColor = null,
    Object? drawingType = null,
    Object? previousDrawingType = null,
  }) {
    return _then(_$TidePaintStateImpl(
      paint: null == paint
          ? _value.paint
          : paint // ignore: cast_nullable_to_non_nullable
              as Paint,
      eraserPaint: null == eraserPaint
          ? _value.eraserPaint
          : eraserPaint // ignore: cast_nullable_to_non_nullable
              as Paint,
      pickerColor: null == pickerColor
          ? _value.pickerColor
          : pickerColor // ignore: cast_nullable_to_non_nullable
              as Color,
      drawingType: null == drawingType
          ? _value.drawingType
          : drawingType // ignore: cast_nullable_to_non_nullable
              as DrawingType,
      previousDrawingType: null == previousDrawingType
          ? _value.previousDrawingType
          : previousDrawingType // ignore: cast_nullable_to_non_nullable
              as DrawingType,
    ));
  }
}

/// @nodoc

class _$TidePaintStateImpl implements _TidePaintState {
  const _$TidePaintStateImpl(
      {required this.paint,
      required this.eraserPaint,
      this.pickerColor = Colors.black,
      this.drawingType = DrawingType.path,
      this.previousDrawingType = DrawingType.path});

  @override
  final Paint paint;
  @override
  final Paint eraserPaint;
  @override
  @JsonKey()
  final Color pickerColor;
  @override
  @JsonKey()
  final DrawingType drawingType;
  @override
  @JsonKey()
  final DrawingType previousDrawingType;

  @override
  String toString() {
    return 'TidePaintState(paint: $paint, eraserPaint: $eraserPaint, pickerColor: $pickerColor, drawingType: $drawingType, previousDrawingType: $previousDrawingType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TidePaintStateImpl &&
            (identical(other.paint, paint) || other.paint == paint) &&
            (identical(other.eraserPaint, eraserPaint) ||
                other.eraserPaint == eraserPaint) &&
            (identical(other.pickerColor, pickerColor) ||
                other.pickerColor == pickerColor) &&
            (identical(other.drawingType, drawingType) ||
                other.drawingType == drawingType) &&
            (identical(other.previousDrawingType, previousDrawingType) ||
                other.previousDrawingType == previousDrawingType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paint, eraserPaint, pickerColor,
      drawingType, previousDrawingType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TidePaintStateImplCopyWith<_$TidePaintStateImpl> get copyWith =>
      __$$TidePaintStateImplCopyWithImpl<_$TidePaintStateImpl>(
          this, _$identity);
}

abstract class _TidePaintState implements TidePaintState {
  const factory _TidePaintState(
      {required final Paint paint,
      required final Paint eraserPaint,
      final Color pickerColor,
      final DrawingType drawingType,
      final DrawingType previousDrawingType}) = _$TidePaintStateImpl;

  @override
  Paint get paint;
  @override
  Paint get eraserPaint;
  @override
  Color get pickerColor;
  @override
  DrawingType get drawingType;
  @override
  DrawingType get previousDrawingType;
  @override
  @JsonKey(ignore: true)
  _$$TidePaintStateImplCopyWith<_$TidePaintStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
