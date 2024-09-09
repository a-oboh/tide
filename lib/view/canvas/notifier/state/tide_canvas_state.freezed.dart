// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tide_canvas_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TideCanvasState {
  TideDrawing? get currentDrawing => throw _privateConstructorUsedError;
  List<TideDrawing> get allDrawings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TideCanvasStateCopyWith<TideCanvasState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TideCanvasStateCopyWith<$Res> {
  factory $TideCanvasStateCopyWith(
          TideCanvasState value, $Res Function(TideCanvasState) then) =
      _$TideCanvasStateCopyWithImpl<$Res, TideCanvasState>;
  @useResult
  $Res call({TideDrawing? currentDrawing, List<TideDrawing> allDrawings});
}

/// @nodoc
class _$TideCanvasStateCopyWithImpl<$Res, $Val extends TideCanvasState>
    implements $TideCanvasStateCopyWith<$Res> {
  _$TideCanvasStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentDrawing = freezed,
    Object? allDrawings = null,
  }) {
    return _then(_value.copyWith(
      currentDrawing: freezed == currentDrawing
          ? _value.currentDrawing
          : currentDrawing // ignore: cast_nullable_to_non_nullable
              as TideDrawing?,
      allDrawings: null == allDrawings
          ? _value.allDrawings
          : allDrawings // ignore: cast_nullable_to_non_nullable
              as List<TideDrawing>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TideCanvasStateImplCopyWith<$Res>
    implements $TideCanvasStateCopyWith<$Res> {
  factory _$$TideCanvasStateImplCopyWith(_$TideCanvasStateImpl value,
          $Res Function(_$TideCanvasStateImpl) then) =
      __$$TideCanvasStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TideDrawing? currentDrawing, List<TideDrawing> allDrawings});
}

/// @nodoc
class __$$TideCanvasStateImplCopyWithImpl<$Res>
    extends _$TideCanvasStateCopyWithImpl<$Res, _$TideCanvasStateImpl>
    implements _$$TideCanvasStateImplCopyWith<$Res> {
  __$$TideCanvasStateImplCopyWithImpl(
      _$TideCanvasStateImpl _value, $Res Function(_$TideCanvasStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentDrawing = freezed,
    Object? allDrawings = null,
  }) {
    return _then(_$TideCanvasStateImpl(
      currentDrawing: freezed == currentDrawing
          ? _value.currentDrawing
          : currentDrawing // ignore: cast_nullable_to_non_nullable
              as TideDrawing?,
      allDrawings: null == allDrawings
          ? _value._allDrawings
          : allDrawings // ignore: cast_nullable_to_non_nullable
              as List<TideDrawing>,
    ));
  }
}

/// @nodoc

class _$TideCanvasStateImpl implements _TideCanvasState {
  const _$TideCanvasStateImpl(
      {this.currentDrawing, final List<TideDrawing> allDrawings = const []})
      : _allDrawings = allDrawings;

  @override
  final TideDrawing? currentDrawing;
  final List<TideDrawing> _allDrawings;
  @override
  @JsonKey()
  List<TideDrawing> get allDrawings {
    if (_allDrawings is EqualUnmodifiableListView) return _allDrawings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allDrawings);
  }

  @override
  String toString() {
    return 'TideCanvasState(currentDrawing: $currentDrawing, allDrawings: $allDrawings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TideCanvasStateImpl &&
            (identical(other.currentDrawing, currentDrawing) ||
                other.currentDrawing == currentDrawing) &&
            const DeepCollectionEquality()
                .equals(other._allDrawings, _allDrawings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentDrawing,
      const DeepCollectionEquality().hash(_allDrawings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TideCanvasStateImplCopyWith<_$TideCanvasStateImpl> get copyWith =>
      __$$TideCanvasStateImplCopyWithImpl<_$TideCanvasStateImpl>(
          this, _$identity);
}

abstract class _TideCanvasState implements TideCanvasState {
  const factory _TideCanvasState(
      {final TideDrawing? currentDrawing,
      final List<TideDrawing> allDrawings}) = _$TideCanvasStateImpl;

  @override
  TideDrawing? get currentDrawing;
  @override
  List<TideDrawing> get allDrawings;
  @override
  @JsonKey(ignore: true)
  _$$TideCanvasStateImplCopyWith<_$TideCanvasStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
