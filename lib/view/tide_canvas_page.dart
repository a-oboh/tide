import 'package:flutter/material.dart';
import 'package:tide/core/domain/models/tide_canvas.dart';

class TideCanvasPage extends StatefulWidget {
  const TideCanvasPage({super.key});

  @override
  State<TideCanvasPage> createState() => _TideCanvasPageState();
}

class _TideCanvasPageState extends State<TideCanvasPage> {
  TideCanvas tideCanvas = TideCanvas(currentDrawing: [], allDrawings: []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            buildAllPoints(),
            buildCurrentPath(),
          ],
        ),
      ),
    );
  }

  Widget buildAllPoints() {
    return RepaintBoundary(
      child: CustomPaint(
        painter: TideCanvasPainter(allPaths: tideCanvas.allDrawings ?? []),
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

        setState(() {
          tideCanvas.currentDrawing = [localPos];
        });
      },
      onPointerMove: (event) {
        var localPos = event.localPosition;

        setState(() {
          tideCanvas.currentDrawing.add(localPos);
        });
      },
      onPointerUp: (event) {
        setState(() {
          tideCanvas.allDrawings?.add(List.from(tideCanvas
              .currentDrawing)); // Add the current drawing as a separate path
          tideCanvas.currentDrawing = []; // Clear current drawing
        });
      },
      child: RepaintBoundary(
        child: CustomPaint(
          painter: TideCanvasPainter(
              allPaths: [tideCanvas.currentDrawing]), // Draw the current path
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
  TideCanvasPainter({required this.allPaths});

  final List<List<Offset>> allPaths;

  final linePaint = Paint() 
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5;

  @override
  void paint(Canvas canvas, Size size) {
    for (var points in allPaths) {
      if (points.isEmpty) continue;

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

      canvas.drawPath(path, linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
