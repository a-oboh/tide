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
  TideDrawing? get removedDrawing => throw _privateConstructorUsedError;
  int? get cachedDrawing => throw _privateConstructorUsedError;
  TideDrawingList get allDrawings => throw _privateConstructorUsedError;
  bool get loadingSavedCanvases => throw _privateConstructorUsedError;
  bool get loadingCanvas => throw _privateConstructorUsedError;
  bool get saveNewCanvasError => throw _privateConstructorUsedError;
  bool get newDrawingSaved => throw _privateConstructorUsedError;
  bool get updatedLocalDrawing => throw _privateConstructorUsedError;
  bool get updateLocalDrawingError => throw _privateConstructorUsedError;
  List<CanvasTableData> get savedCanvases => throw _privateConstructorUsedError;

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
  $Res call(
      {TideDrawing? currentDrawing,
      TideDrawing? removedDrawing,
      int? cachedDrawing,
      TideDrawingList allDrawings,
      bool loadingSavedCanvases,
      bool loadingCanvas,
      bool saveNewCanvasError,
      bool newDrawingSaved,
      bool updatedLocalDrawing,
      bool updateLocalDrawingError,
      List<CanvasTableData> savedCanvases});

  $TideDrawingCopyWith<$Res>? get currentDrawing;
  $TideDrawingCopyWith<$Res>? get removedDrawing;
  $TideDrawingListCopyWith<$Res> get allDrawings;
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
    Object? removedDrawing = freezed,
    Object? cachedDrawing = freezed,
    Object? allDrawings = null,
    Object? loadingSavedCanvases = null,
    Object? loadingCanvas = null,
    Object? saveNewCanvasError = null,
    Object? newDrawingSaved = null,
    Object? updatedLocalDrawing = null,
    Object? updateLocalDrawingError = null,
    Object? savedCanvases = null,
  }) {
    return _then(_value.copyWith(
      currentDrawing: freezed == currentDrawing
          ? _value.currentDrawing
          : currentDrawing // ignore: cast_nullable_to_non_nullable
              as TideDrawing?,
      removedDrawing: freezed == removedDrawing
          ? _value.removedDrawing
          : removedDrawing // ignore: cast_nullable_to_non_nullable
              as TideDrawing?,
      cachedDrawing: freezed == cachedDrawing
          ? _value.cachedDrawing
          : cachedDrawing // ignore: cast_nullable_to_non_nullable
              as int?,
      allDrawings: null == allDrawings
          ? _value.allDrawings
          : allDrawings // ignore: cast_nullable_to_non_nullable
              as TideDrawingList,
      loadingSavedCanvases: null == loadingSavedCanvases
          ? _value.loadingSavedCanvases
          : loadingSavedCanvases // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingCanvas: null == loadingCanvas
          ? _value.loadingCanvas
          : loadingCanvas // ignore: cast_nullable_to_non_nullable
              as bool,
      saveNewCanvasError: null == saveNewCanvasError
          ? _value.saveNewCanvasError
          : saveNewCanvasError // ignore: cast_nullable_to_non_nullable
              as bool,
      newDrawingSaved: null == newDrawingSaved
          ? _value.newDrawingSaved
          : newDrawingSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedLocalDrawing: null == updatedLocalDrawing
          ? _value.updatedLocalDrawing
          : updatedLocalDrawing // ignore: cast_nullable_to_non_nullable
              as bool,
      updateLocalDrawingError: null == updateLocalDrawingError
          ? _value.updateLocalDrawingError
          : updateLocalDrawingError // ignore: cast_nullable_to_non_nullable
              as bool,
      savedCanvases: null == savedCanvases
          ? _value.savedCanvases
          : savedCanvases // ignore: cast_nullable_to_non_nullable
              as List<CanvasTableData>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TideDrawingCopyWith<$Res>? get currentDrawing {
    if (_value.currentDrawing == null) {
      return null;
    }

    return $TideDrawingCopyWith<$Res>(_value.currentDrawing!, (value) {
      return _then(_value.copyWith(currentDrawing: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TideDrawingCopyWith<$Res>? get removedDrawing {
    if (_value.removedDrawing == null) {
      return null;
    }

    return $TideDrawingCopyWith<$Res>(_value.removedDrawing!, (value) {
      return _then(_value.copyWith(removedDrawing: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TideDrawingListCopyWith<$Res> get allDrawings {
    return $TideDrawingListCopyWith<$Res>(_value.allDrawings, (value) {
      return _then(_value.copyWith(allDrawings: value) as $Val);
    });
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
  $Res call(
      {TideDrawing? currentDrawing,
      TideDrawing? removedDrawing,
      int? cachedDrawing,
      TideDrawingList allDrawings,
      bool loadingSavedCanvases,
      bool loadingCanvas,
      bool saveNewCanvasError,
      bool newDrawingSaved,
      bool updatedLocalDrawing,
      bool updateLocalDrawingError,
      List<CanvasTableData> savedCanvases});

  @override
  $TideDrawingCopyWith<$Res>? get currentDrawing;
  @override
  $TideDrawingCopyWith<$Res>? get removedDrawing;
  @override
  $TideDrawingListCopyWith<$Res> get allDrawings;
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
    Object? removedDrawing = freezed,
    Object? cachedDrawing = freezed,
    Object? allDrawings = null,
    Object? loadingSavedCanvases = null,
    Object? loadingCanvas = null,
    Object? saveNewCanvasError = null,
    Object? newDrawingSaved = null,
    Object? updatedLocalDrawing = null,
    Object? updateLocalDrawingError = null,
    Object? savedCanvases = null,
  }) {
    return _then(_$TideCanvasStateImpl(
      currentDrawing: freezed == currentDrawing
          ? _value.currentDrawing
          : currentDrawing // ignore: cast_nullable_to_non_nullable
              as TideDrawing?,
      removedDrawing: freezed == removedDrawing
          ? _value.removedDrawing
          : removedDrawing // ignore: cast_nullable_to_non_nullable
              as TideDrawing?,
      cachedDrawing: freezed == cachedDrawing
          ? _value.cachedDrawing
          : cachedDrawing // ignore: cast_nullable_to_non_nullable
              as int?,
      allDrawings: null == allDrawings
          ? _value.allDrawings
          : allDrawings // ignore: cast_nullable_to_non_nullable
              as TideDrawingList,
      loadingSavedCanvases: null == loadingSavedCanvases
          ? _value.loadingSavedCanvases
          : loadingSavedCanvases // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingCanvas: null == loadingCanvas
          ? _value.loadingCanvas
          : loadingCanvas // ignore: cast_nullable_to_non_nullable
              as bool,
      saveNewCanvasError: null == saveNewCanvasError
          ? _value.saveNewCanvasError
          : saveNewCanvasError // ignore: cast_nullable_to_non_nullable
              as bool,
      newDrawingSaved: null == newDrawingSaved
          ? _value.newDrawingSaved
          : newDrawingSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedLocalDrawing: null == updatedLocalDrawing
          ? _value.updatedLocalDrawing
          : updatedLocalDrawing // ignore: cast_nullable_to_non_nullable
              as bool,
      updateLocalDrawingError: null == updateLocalDrawingError
          ? _value.updateLocalDrawingError
          : updateLocalDrawingError // ignore: cast_nullable_to_non_nullable
              as bool,
      savedCanvases: null == savedCanvases
          ? _value._savedCanvases
          : savedCanvases // ignore: cast_nullable_to_non_nullable
              as List<CanvasTableData>,
    ));
  }
}

/// @nodoc

class _$TideCanvasStateImpl implements _TideCanvasState {
  const _$TideCanvasStateImpl(
      {this.currentDrawing,
      this.removedDrawing,
      this.cachedDrawing,
      this.allDrawings = const TideDrawingList(),
      this.loadingSavedCanvases = false,
      this.loadingCanvas = false,
      this.saveNewCanvasError = false,
      this.newDrawingSaved = false,
      this.updatedLocalDrawing = false,
      this.updateLocalDrawingError = false,
      final List<CanvasTableData> savedCanvases = const []})
      : _savedCanvases = savedCanvases;

  @override
  final TideDrawing? currentDrawing;
  @override
  final TideDrawing? removedDrawing;
  @override
  final int? cachedDrawing;
  @override
  @JsonKey()
  final TideDrawingList allDrawings;
  @override
  @JsonKey()
  final bool loadingSavedCanvases;
  @override
  @JsonKey()
  final bool loadingCanvas;
  @override
  @JsonKey()
  final bool saveNewCanvasError;
  @override
  @JsonKey()
  final bool newDrawingSaved;
  @override
  @JsonKey()
  final bool updatedLocalDrawing;
  @override
  @JsonKey()
  final bool updateLocalDrawingError;
  final List<CanvasTableData> _savedCanvases;
  @override
  @JsonKey()
  List<CanvasTableData> get savedCanvases {
    if (_savedCanvases is EqualUnmodifiableListView) return _savedCanvases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedCanvases);
  }

  @override
  String toString() {
    return 'TideCanvasState(currentDrawing: $currentDrawing, removedDrawing: $removedDrawing, cachedDrawing: $cachedDrawing, allDrawings: $allDrawings, loadingSavedCanvases: $loadingSavedCanvases, loadingCanvas: $loadingCanvas, saveNewCanvasError: $saveNewCanvasError, newDrawingSaved: $newDrawingSaved, updatedLocalDrawing: $updatedLocalDrawing, updateLocalDrawingError: $updateLocalDrawingError, savedCanvases: $savedCanvases)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TideCanvasStateImpl &&
            (identical(other.currentDrawing, currentDrawing) ||
                other.currentDrawing == currentDrawing) &&
            (identical(other.removedDrawing, removedDrawing) ||
                other.removedDrawing == removedDrawing) &&
            (identical(other.cachedDrawing, cachedDrawing) ||
                other.cachedDrawing == cachedDrawing) &&
            (identical(other.allDrawings, allDrawings) ||
                other.allDrawings == allDrawings) &&
            (identical(other.loadingSavedCanvases, loadingSavedCanvases) ||
                other.loadingSavedCanvases == loadingSavedCanvases) &&
            (identical(other.loadingCanvas, loadingCanvas) ||
                other.loadingCanvas == loadingCanvas) &&
            (identical(other.saveNewCanvasError, saveNewCanvasError) ||
                other.saveNewCanvasError == saveNewCanvasError) &&
            (identical(other.newDrawingSaved, newDrawingSaved) ||
                other.newDrawingSaved == newDrawingSaved) &&
            (identical(other.updatedLocalDrawing, updatedLocalDrawing) ||
                other.updatedLocalDrawing == updatedLocalDrawing) &&
            (identical(
                    other.updateLocalDrawingError, updateLocalDrawingError) ||
                other.updateLocalDrawingError == updateLocalDrawingError) &&
            const DeepCollectionEquality()
                .equals(other._savedCanvases, _savedCanvases));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentDrawing,
      removedDrawing,
      cachedDrawing,
      allDrawings,
      loadingSavedCanvases,
      loadingCanvas,
      saveNewCanvasError,
      newDrawingSaved,
      updatedLocalDrawing,
      updateLocalDrawingError,
      const DeepCollectionEquality().hash(_savedCanvases));

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
      final TideDrawing? removedDrawing,
      final int? cachedDrawing,
      final TideDrawingList allDrawings,
      final bool loadingSavedCanvases,
      final bool loadingCanvas,
      final bool saveNewCanvasError,
      final bool newDrawingSaved,
      final bool updatedLocalDrawing,
      final bool updateLocalDrawingError,
      final List<CanvasTableData> savedCanvases}) = _$TideCanvasStateImpl;

  @override
  TideDrawing? get currentDrawing;
  @override
  TideDrawing? get removedDrawing;
  @override
  int? get cachedDrawing;
  @override
  TideDrawingList get allDrawings;
  @override
  bool get loadingSavedCanvases;
  @override
  bool get loadingCanvas;
  @override
  bool get saveNewCanvasError;
  @override
  bool get newDrawingSaved;
  @override
  bool get updatedLocalDrawing;
  @override
  bool get updateLocalDrawingError;
  @override
  List<CanvasTableData> get savedCanvases;
  @override
  @JsonKey(ignore: true)
  _$$TideCanvasStateImplCopyWith<_$TideCanvasStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
