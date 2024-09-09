import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tide_paint_state.freezed.dart';

@freezed
class TidePaintState with _$TidePaintState {
  const factory TidePaintState({
    required Paint paint,
  }) = _TidePaintState;
}
