import 'package:flutter/material.dart';

class TideDrawing {
  TideDrawing(
      {required this.currentDrawing, this.allDrawings, required this.paint});

  List<Offset> currentDrawing;
  List<List<Offset>>? allDrawings;
  Paint paint;
}
