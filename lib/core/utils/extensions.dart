import 'package:flutter/material.dart';

extension SizedBoxExt on num {
  get height => SizedBox(height: toDouble());
  get width => SizedBox(width: toDouble());
}

extension MqExt on BuildContext {
  get height => MediaQuery.of(this).size.height;
  get width => MediaQuery.of(this).size.width;
}
