import 'package:flutter/material.dart';

class TideCanvas extends StatefulWidget {
  const TideCanvas({super.key});

  @override
  State<TideCanvas> createState() => _TideCanvasState();
}

class _TideCanvasState extends State<TideCanvas> {
  Offset panPosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          // onTapDown: (details) {
          //   var localPos = details.localPosition;
          //   var globPos = details.globalPosition;

          //   print(localPos);
          //   print(globPos);
          // },
          onPanUpdate: (details) {
            var localPos = details.localPosition;
            var globPos = details.globalPosition;

            setState(() {
              panPosition = localPos;
            });
          },

          child: CustomPaint(
            painter: TideCanvasPainter(),
            child: const SizedBox.expand(),
          ),
        ),
      ),
    );
  }
}

class TideCanvasPainter extends CustomPainter {
  const TideCanvasPainter({this.panPosition});
  
  final Offset panPosition;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;
    final Rect rect = Offset.zero & size;
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
