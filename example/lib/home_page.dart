import 'package:flutter/material.dart';

import 'package:journey_path/journey_path.dart';
import 'package:journey_path/models/models.dart';
import 'package:journey_path/models/timeline.dart';

class HomePage extends StatelessWidget {
  final Timeline timeline = Timeline(
    color: Colors.red,
    thickness: 2.0,
  );

  final ConnectedDot connectedDot = ConnectedDot(
    number: 4,
    edgeColor: Colors.red,
    spaceBetween: 150.0,
    edgeSize: 70,
    middleColorDots: Colors.blue,
  );

  final ConnectedLine connectedLine = ConnectedLine(
    size: 30,
    color: Colors.red,
  );

  final InformationCard informationCard =
      InformationCard(height: 60, width: 120, list: [
    InformationCardDetails(name: 'name1', description: 'description1'),
    InformationCardDetails(name: 'name2', description: 'description2'),
    InformationCardDetails(name: 'name3', description: 'description3'),
    InformationCardDetails(name: 'name4', description: 'description4'),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journey Path'),
      ),
      body: Center(
        child: Container(
          child: JourneyPath(
            timeline: timeline,
            connectedDot: connectedDot,
            connectedLine: connectedLine,
            listInformationCard: informationCard,
          ),
        ),
      ),
    );
  }
}
