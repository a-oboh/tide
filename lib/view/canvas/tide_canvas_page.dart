import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tide/core/domain/models/tide_canvas.dart';
import 'package:tide/view/canvas/notifier/tide_canvas_notifier.dart';
import 'package:tide/view/widgets/canvas_settings_widget.dart';

class TideCanvasPage extends ConsumerStatefulWidget {
  const TideCanvasPage({super.key});

  @override
  ConsumerState<TideCanvasPage> createState() => _TideCanvasPageState();
}

class _TideCanvasPageState extends ConsumerState<TideCanvasPage>
    with TickerProviderStateMixin {
  late AnimationController aController;
  late Animation<double> canvasSettingsAnimation;

  @override
  void initState() {
    super.initState();
    aController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    canvasSettingsAnimation = Tween(begin: 0.0, end: 1.0).animate(aController);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final canvasState = ref.read(tideCanvasNotifierProvider);

      currentDrawing = canvasState.currentDrawing;
    });
  }

  TideDrawing? currentDrawing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            buildAllPoints(),
            buildCurrentPath(),
            AnimatedBuilder(
                animation: canvasSettingsAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, 100 * canvasSettingsAnimation.value),
                    child: Container(
                      child: const CanvasSettingsWidget(),
                    ),
                  );
                }),
            IconButton(
                onPressed: () {
                  if (aController.value > 0.0) {
                    aController.reverse();
                  } else {
                    aController.forward(from: 0.0);
                  }
                },
                icon: const Icon(Icons.menu)),
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

  Widget buildCurrentPath() {
    return Listener(
      onPointerDown: (event) {
        var localPos = event.localPosition;

        var paint = ref.read(tideCanvasNotifierProvider).paint;

        var drawing = TideDrawing(
          currentDrawing: [localPos],
          paint: paint,
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
            ref.watch(tideCanvasNotifierProvider).currentDrawing
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

  final linePaint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5;

  @override
  void paint(Canvas canvas, Size size) {
    // for (var points in allPaths) {
    //   if (points.isEmpty) continue;

    //   final path = Path();
    //   path.moveTo(points.first.dx, points.first.dy);

    //   for (var i = 0; i < points.length - 1; i++) {
    //     var point = points[i];
    //     var nextPoint = points[i + 1];

    //     path.quadraticBezierTo(
    //       point.dx,
    //       point.dy,
    //       (point.dx + nextPoint.dx) / 2,
    //       (point.dy + nextPoint.dy) / 2,
    //     );
    //   }

    //   canvas.drawPath(path, linePaint);
    // }

    for (var drawing in allDrawings) {
      if ((drawing?.currentDrawing.isEmpty ?? true) || drawing?.paint == null) {
        continue;
      }

      final points = drawing!.currentDrawing;

      final path = Path();
      path.moveTo(points.first.dx, points.first.dy);

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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
