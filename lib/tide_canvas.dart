import 'package:flutter/material.dart';

class TideCanvas extends StatefulWidget {
  const TideCanvas({super.key});

  @override
  State<TideCanvas> createState() => _TideCanvasState();
}

class _TideCanvasState extends State<TideCanvas> {
  Offset panPosition = Offset.zero;
  Offset? panStart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onPanDown: (details) {
            var localPos = details.localPosition;
            var globPos = details.globalPosition;

            setState(() {
              panStart = localPos;
            });
          },
          onPanUpdate: (details) {
            var localPos = details.localPosition;
            var globPos = details.globalPosition;

            setState(() {
              panPosition = localPos;
            });
          },
          child: RepaintBoundary(
            child: CustomPaint(
              painter: TideCanvasPainter(
                panPosition: panPosition,
                panStart: panStart,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TideCanvasPainter extends CustomPainter {
  TideCanvasPainter({required this.panPosition, required this.panStart});

  final Offset panPosition;
  final Offset? panStart;

  final bgRectPaint = Paint()..color = Colors.black;
  final linePaint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5;
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    canvas.drawRect(rect, bgRectPaint);
    // canvas.drawLine(panStart ?? panPosition, panPosition, linePaint);

    if (panStart != null) {
      // Create a Path to draw from panStart to panPosition
      final path1 = Path();
      path1.moveTo(panStart!.dx, panStart!.dy);
      // path1.lineTo(panPosition.dx, panPosition.dy);
      path1.quadraticBezierTo(
          panStart!.dx / 2, panStart!.dy / 2, panPosition.dx, panPosition.dy);

      // Draw the path with the line paint
      canvas.drawPath(path1, linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class TestPainter extends CustomPainter {
  final linePaint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 20;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
