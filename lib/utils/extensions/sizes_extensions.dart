import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double widthPercentage(double percentage) =>
      MediaQuery.of(this).size.width * percentage;

  double heightPercentage(double percentage) =>
      MediaQuery.of(this).size.height * percentage;
}
