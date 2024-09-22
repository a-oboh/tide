import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tide_canvas.freezed.dart';
part 'tide_canvas.g.dart';

@freezed
class TideDrawing with _$TideDrawing {
  const factory TideDrawing({
    @OffsetConverter() @Default([]) List<Offset> currentDrawing,
    @OffsetConverter() @Default([]) List<List<Offset>>? allDrawings,
    @PaintConverter() required Paint paint,
    @Default(DrawingType.path) DrawingType drawingType,
  }) = _TideDrawing;

  factory TideDrawing.fromJson(Map<String, dynamic> json) =>
      _$TideDrawingFromJson(json);
}


class OffsetConverter implements JsonConverter<Offset, Map<String, dynamic>> {
  const OffsetConverter();

  @override
  Offset fromJson(Map<String, dynamic> json) {
    return Offset(json['dx'] as double, json['dy'] as double);
  }

  @override
  Map<String, dynamic> toJson(Offset offset) => {
    'dx': offset.dx,
    'dy': offset.dy,
  };
}


class PaintConverter implements JsonConverter<Paint, Map<String, dynamic>> {
  const PaintConverter();

  @override
  Paint fromJson(Map<String, dynamic> json) {
    return Paint()
      ..color = Color(json['color'] as int)
      ..strokeWidth = (json['strokeWidth'] as num).toDouble()
      ..style = json['style'] == 'fill' ? PaintingStyle.fill : PaintingStyle.stroke;
  }

  @override
  Map<String, dynamic> toJson(Paint paint) => {
    'color': paint.color.value,
    'strokeWidth': paint.strokeWidth,
    'style': paint.style == PaintingStyle.fill ? 'fill' : 'stroke',
  };
}

enum DrawingType {
  path,
  rectangle,
  oval,
  triangle,
  eraser,
}
