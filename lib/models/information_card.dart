import 'package:flutter/material.dart';

class InformationCard {
  InformationCard({
    @required this.width,
    @required this.height,
    @required this.list,
  });
  final double height;
  final double width;
  final List<InformationCardDetails> list;
}

class InformationCardDetails {
  InformationCardDetails({
    @required this.name,
    this.description,
  });
  final String name;
  final String description;
}
