import 'package:flutter/material.dart';

class TideCanvas {
  TideCanvas({required this.currentDrawing, this.allDrawings});

  List<Offset> currentDrawing;
  List<List<Offset>>? allDrawings;
}
