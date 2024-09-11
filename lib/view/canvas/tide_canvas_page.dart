import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tide/core/domain/models/tide_canvas.dart';
import 'package:tide/view/notifier/tide_canvas_notifier.dart';
import 'package:tide/view/notifier/tide_paint_notifier.dart';
import 'package:tide/view/widgets/canvas_settings_widget.dart';

class TideCanvasPage extends ConsumerStatefulWidget {
  const TideCanvasPage({super.key});

  @override
  ConsumerState<TideCanvasPage> createState() => _TideCanvasPageState();
}

class _TideCanvasPageState extends ConsumerState<TideCanvasPage>
    with TickerProviderStateMixin {
  late AnimationController aController;
  late Animation<double> paintSettingsPosition;
  late Animation<double> paintSettingsOpacity;

  @override
  void initState() {
    super.initState();
    aController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    paintSettingsPosition = Tween(begin: -1.0, end: 1.0).animate(aController);
    paintSettingsOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: aController,
      curve: const Interval(0.5, 0.8),
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final canvasState = ref.read(tideCanvasNotifierProvider);

      currentDrawing = canvasState.currentDrawing;
    });
  }

  TideDrawing? currentDrawing;

  @override
  Widget build(BuildContext context) {
    var paintState = ref.watch(tidePaintNotifierProvider);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            buildAllPoints(),
            buildCurrentPath(
              paint: paintState.paint,
              drawingType: paintState.drawingType,
            ),
            AnimatedBuilder(
                animation: paintSettingsPosition,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, 50 * paintSettingsPosition.value),
                    child: Opacity(
                      opacity: paintSettingsOpacity.value,
                      child: const CanvasSettingsWidget(),
                    ),
                  );
                }),
            IconButton(
              onPressed: () {
                if (aController.value > 0.5) {
                  aController.reverse();
                } else {
                  aController.forward(from: 0.0);
                }
              },
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    aController.dispose();
    super.dispose();
  }

  Widget buildAllPoints() {
    final allDrawings = ref.watch(tideCanvasNotifierProvider).allDrawings;

    return RepaintBoundary(
      child: CustomPaint(
        painter: TideCanvasPainter(allDrawings: allDrawings ?? []),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }

  Widget buildCurrentPath({
    required Paint paint,
    required DrawingType drawingType,
  }) {
    return Listener(
      onPointerDown: (event) {
        var localPos = event.localPosition;

        var drawing = TideDrawing(
          currentDrawing: [localPos],
          paint: paint,
          drawingType: drawingType,
        );

        ref
            .read(tideCanvasNotifierProvider.notifier)
            .setCurrentDrawing(drawing);
      },
      onPointerMove: (event) {
        var localPos = event.localPosition;

        var currentDrawing =
            ref.read(tideCanvasNotifierProvider).currentDrawing;
        currentDrawing?.currentDrawing.add(localPos);
        ref
            .read(tideCanvasNotifierProvider.notifier)
            .updateCurrentDrawing(currentDrawing);
      },
      onPointerUp: (event) {
        var currentDrawing =
            ref.read(tideCanvasNotifierProvider).currentDrawing;

        ref
            .read(tideCanvasNotifierProvider.notifier)
            .addToDrawings(currentDrawing);
      },
      child: RepaintBoundary(
        child: CustomPaint(
          painter: TideCanvasPainter(allDrawings: [
            ref.read(tideCanvasNotifierProvider).currentDrawing
          ]), // Draw the current path
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}

class TideCanvasPainter extends CustomPainter {
  TideCanvasPainter({required this.allDrawings});

  // final List<List<Offset>> allPaths;
  final List<TideDrawing?> allDrawings;

  @override
  void paint(Canvas canvas, Size size) {
    for (var drawing in allDrawings) {
      if ((drawing?.currentDrawing.isEmpty ?? true) || drawing?.paint == null) {
        continue;
      }

      final points = drawing!.currentDrawing;

      final path = Path();
      path.moveTo(points.first.dx, points.first.dy);

      switch (drawing.drawingType) {
        case DrawingType.rectangle:
          Rect rect = Rect.fromPoints(points.first, points.last);
          canvas.drawRect(rect, drawing.paint);
          break;
        case DrawingType.oval:
          Rect rect = Rect.fromPoints(points.first, points.last);
          canvas.drawOval(rect, drawing.paint);
          break;
        default:
          for (var i = 0; i < points.length - 1; i++) {
            var point = points[i];
            var nextPoint = points[i + 1];

            path.quadraticBezierTo(
              point.dx,
              point.dy,
              (point.dx + nextPoint.dx) / 2,
              (point.dy + nextPoint.dy) / 2,
            );
          }

          canvas.drawPath(path, drawing.paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
