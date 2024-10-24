import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tide/core/domain/database/dao/canvas_dao.dart';
import 'package:tide/core/domain/database/database.dart';
import 'package:tide/core/domain/models/tide_drawing.dart';
import 'package:tide/core/services/prefs_service.dart';
import 'package:tide/view/canvas/notifier/tide_canvas_notifier.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import '../../../core/utils/fake_data.dart';
import '../../../core/utils/mocks.dart';
import '../../../core/utils/test_riverpod_container.dart';

void main() {
  late AppDatabase appDatabase;
  late CanvasDao canvasDao;
  late PrefsService prefsService;

  setUp(() {
    appDatabase = AppDatabase.forTesting(NativeDatabase.memory());
    prefsService = PrefsServiceMock();
    canvasDao = CanvasDao(appDatabase);
  });

  tearDown(() async {
    await appDatabase.close();
  });

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

    test('create new drawing successfully', () async {
      when(() => prefsService.saveInt(any(), any())).thenAnswer((_) => Future.value(null));
      
      final container = createTestContainer(overrides: [
        dbProvider.overrideWithValue(appDatabase),
        canvasDaoProvider.overrideWithValue(canvasDao),
        prefsServiceProvider.overrideWithValue(prefsService)
      ]);
      final state = container.read(tideCanvasNotifierProvider);
      final notifier = container.read(tideCanvasNotifierProvider.notifier);

      expect(state.cachedDrawing, null);
      expect(state.newDrawingSaved, false);

      //save fake drawing and expect state changes
      final title = 'drawing_1';
      await notifier.createNewEntry(title, fakeDrawing, fakeDrawingList);

      final newState = container.read(tideCanvasNotifierProvider);

      // expect(newState.cachedDrawing, isNot(null));
      expect(newState.newDrawingSaved, true);
    });
  });
}
