import 'package:flutter/material.dart';

class InformationCard {
  final double height;
  final double width;
  final List<InformationCardDetails> list;

  InformationCard({
    @required this.width,
    @required this.height,
    @required this.list,
  });
}

class InformationCardDetails {
  final String name;
  final String description;
  InformationCardDetails({
    @required this.name,
    this.description,
  });
}
