import 'package:flutter/material.dart';

class ConnectedDot {
  ConnectedDot({
    @required this.edgeColor,
    @required this.edgeSize,
    @required this.spaceBetween,
    @required this.number,
    @required this.middleColorDots,
  });
  Color edgeColor;
  Color middleColorDots;
  double edgeSize;
  double spaceBetween;
  int number;
}
