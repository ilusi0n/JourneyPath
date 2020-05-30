import 'package:flutter/material.dart';

class InformationCard {
  final String name;
  final String description;
  final double height;
  final double width;

  InformationCard({
    @required this.name,
    @required this.width,
    @required this.height,
    this.description,
  });
}
