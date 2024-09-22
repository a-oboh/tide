// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tide_canvas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TideDrawingImpl _$$TideDrawingImplFromJson(Map<String, dynamic> json) =>
    _$TideDrawingImpl(
      currentDrawing: (json['currentDrawing'] as List<dynamic>?)
              ?.map((e) =>
                  const OffsetConverter().fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      allDrawings: (json['allDrawings'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) => const OffsetConverter()
                      .fromJson(e as Map<String, dynamic>))
                  .toList())
              .toList() ??
          const [],
      paint: const PaintConverter()
          .fromJson(json['paint'] as Map<String, dynamic>),
      drawingType:
          $enumDecodeNullable(_$DrawingTypeEnumMap, json['drawingType']) ??
              DrawingType.path,
    );

Map<String, dynamic> _$$TideDrawingImplToJson(_$TideDrawingImpl instance) =>
    <String, dynamic>{
      'currentDrawing':
          instance.currentDrawing.map(const OffsetConverter().toJson).toList(),
      'allDrawings': instance.allDrawings
          ?.map((e) => e.map(const OffsetConverter().toJson).toList())
          .toList(),
      'paint': const PaintConverter().toJson(instance.paint),
      'drawingType': _$DrawingTypeEnumMap[instance.drawingType]!,
    };

const _$DrawingTypeEnumMap = {
  DrawingType.path: 'path',
  DrawingType.rectangle: 'rectangle',
  DrawingType.oval: 'oval',
  DrawingType.triangle: 'triangle',
  DrawingType.eraser: 'eraser',
};
