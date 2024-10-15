import 'package:flutter_test/flutter_test.dart';
import 'package:tide/view/canvas/notifier/tide_canvas_notifier.dart';

import '../../../core/utils/test_riverpod_container.dart';

void main() {
  group('Tide canvas notifier', () {
   
    test('Drawing default values', () {
      final podContainer = createTestContainer();
      
      final sub = podContainer.listen(tideCanvasNotifierProvider, (_, __) {});

      final state = sub.read();

      expect(state.currentDrawing, equals(null));
    });
  });
}
