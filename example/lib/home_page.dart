import 'package:flutter/material.dart';

import 'package:journey_path/journey_path.dart';
import 'package:journey_path/models/models.dart';
import 'package:journey_path/models/timeline.dart';

class HomePage extends StatelessWidget {
  final timeline = Timeline(
    color: Colors.red,
    thickness: 2.0,
  );

  final connectedDot = ConnectedDot(
    number: 4,
    edgeColor: Colors.red,
    spaceBetween: 150.0,
    edgeSize: 70,
    middleColorDots: Colors.blue,
  );

  final connectedLine = ConnectedLine(
    size: 30,
    color: Colors.red,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journey Path'),
      ),
      body: Center(
        child: Container(
          child: JourneyPath(
            timeline: timeline,
            connectedDot: connectedDot,
            connectedLine: connectedLine,
          ),
        ),
      ),
    );
  }
}
