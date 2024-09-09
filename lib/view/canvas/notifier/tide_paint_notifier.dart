import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tide/view/canvas/notifier/state/tide_paint_state.dart';

part 'tide_paint_notifier.g.dart';

@riverpod
class TidePaintNotifier extends _$TidePaintNotifier {
  @override
  TidePaintState build() {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    return TidePaintState(paint: paint);
  }

  void setPaintColor(Color color) {
    var paint = state.paint;

    state = state.copyWith(
        paint: Paint()
          ..color = color
          ..style = paint.style
          ..strokeWidth = Random().nextInt(4) + 2);

    print('New paint color is: ${state.paint.color}');
  }
}
