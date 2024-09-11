import 'package:flutter/material.dart';

class TideDrawing {
  TideDrawing({
    required this.currentDrawing,
    this.allDrawings,
    required this.paint,
    this.drawingType = DrawingType.path,
  });

  List<Offset> currentDrawing;
  List<List<Offset>>? allDrawings;
  Paint paint;
  DrawingType drawingType;
}

enum DrawingType {
  path,
  rectangle,
  oval,
}
