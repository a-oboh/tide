import 'package:flutter/material.dart';

class TideCanvas {
  TideCanvas({required this.currentDrawing, this.allDrawings, this.paint});

  List<Offset> currentDrawing;
  List<List<Offset>>? allDrawings;
  Paint? paint;
}
