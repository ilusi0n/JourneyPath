import 'package:flutter/material.dart';
import 'package:journey_path/journey_path.dart';
import 'package:journey_path/models/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final Timeline timeline = Timeline(
    color: Colors.grey,
    thickness: 2.0,
  );

  final ConnectedDot connectedDot = ConnectedDot(
    number: 4,
    edgeColor: Colors.red,
    spaceBetween: 150.0,
    edgeSize: 70,
    middleColorDots: Colors.green,
  );

  final ConnectedLine connectedLine = ConnectedLine(
    size: 30,
    color: Colors.grey,
  );

  final InformationCard informationCard = InformationCard(
    height: 60,
    width: 120,
    color: Colors.blue[100],
    list: [
      InformationCardDetails(name: 'name1', description: 'description1'),
      InformationCardDetails(name: 'name2', description: 'description2'),
      InformationCardDetails(name: 'name3', description: 'description3'),
      InformationCardDetails(name: 'name4', description: 'description4'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journey Path'),
      ),
      body: JourneyPath(
        timeline: timeline,
        connectedDot: connectedDot,
        connectedLine: connectedLine,
        listInformationCard: informationCard,
      ),
    );
  }
}
