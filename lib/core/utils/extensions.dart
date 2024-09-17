import 'package:flutter/material.dart';

extension SizedBoxExt on num {
  get height => SizedBox(height: toDouble());
  get width => SizedBox(width: toDouble());
}
