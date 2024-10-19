import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:tide/core/domain/models/tide_drawing.dart';
import 'package:tide/view/canvas/notifier/tide_canvas_notifier.dart';

import '../../../core/utils/test_riverpod_container.dart';

void main() {
  group('Tide canvas notifier', () {
    test('Drawing default values', () {
      final podContainer = createTestContainer();

      final sub = podContainer.listen(tideCanvasNotifierProvider, (_, __) {});

      final state = sub.read();

      expect(state.currentDrawing, equals(null));
      expect(state.allDrawings, isA<TideDrawingList>());
    });

    test('Current drawing value after state change', () {
      final container = createTestContainer();

      final state = container.read(tideCanvasNotifierProvider);
      final notifier = container.read(tideCanvasNotifierProvider.notifier);

      // values empty
      expect(state.currentDrawing, equals(null));
      expect(state.allDrawings, isA<TideDrawingList>());

      // modify data
      final testDrawing = TideDrawing(
        paint: Paint(),
        currentDrawing: [Offset.zero],
      );

      notifier.setCurrentDrawing(testDrawing);
      final newState = container.read(tideCanvasNotifierProvider);

      expect(newState.currentDrawing, equals(testDrawing));
    });
  });
}
