import 'package:flutter/material.dart';

class TideCanvasPage extends StatefulWidget {
  const TideCanvasPage({super.key});

  @override
  State<TideCanvasPage> createState() => _TideCanvasPageState();
}

class _TideCanvasPageState extends State<TideCanvasPage> {
  Offset panPosition = Offset.zero;

  List<Offset> points = [];
  List<Offset> allPoints = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          buildAllPoints(),
          buildCurrentPath(),
        ],
      )),
    );
  }

  Widget buildAllPoints() {
    return RepaintBoundary(
      child: CustomPaint(
        painter: TideCanvasPainter(
          points: allPoints,
        ),
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
          points = [localPos];
        });
      },
      onPointerMove: (event) {
        var localPos = event.localPosition;

        if (localPos != points[points.length - 1]) {
          setState(() {
            points = [...points, localPos];
          });
        }
      },
      onPointerUp: (event) {
        setState(() {
          allPoints = [
            ...allPoints,
            ...points,
          ];
        });
      },
      child: RepaintBoundary(
        child: CustomPaint(
          painter: TideCanvasPainter(
            points: points,
          ),
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
  TideCanvasPainter({
    required this.points,
  });

  List<Offset> points;

  final bgRectPaint = Paint()..color = Colors.black;
  final linePaint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5;
  @override
  void paint(Canvas canvas, Size size) {
    final path1 = Path();
    path1.moveTo(points.first.dx, points.first.dy);

    if (points.isNotEmpty) {
      for (var i = 0; i < points.length - 1; i++) {
        var point = points[i];
        var nextPoint = points[i + 1];

        print("point: $point");
        print("next point: $nextPoint");

        // Create a Path to draw from panStart to panPosition

        // path1.lineTo(panPosition.dx, panPosition.dy);
        path1.quadraticBezierTo(
          point.dx,
          point.dy,
          (point.dx + nextPoint.dx) / 2,
          (point.dy + nextPoint.dy) / 2,
        );
      }
    }

    canvas.drawPath(path1, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
