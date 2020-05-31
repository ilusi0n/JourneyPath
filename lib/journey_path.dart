library journey_path;

import 'package:flutter/material.dart';
import 'package:journey_path/models/connected_line.dart';

import 'models/models.dart';
part 'utils/information_card_utils.dart';
part 'utils/connected_line_utils.dart';
part 'utils/connected_dots_utils.dart';

class JourneyPath extends StatelessWidget {
  const JourneyPath({
    @required this.timeline,
    @required this.connectedDot,
    @required this.connectedLine,
    @required this.listInformationCard,
  });
  double get connectedDotSize => 24.0;
  final Timeline timeline;
  final ConnectedDot connectedDot;
  final ConnectedLine connectedLine;
  final InformationCard listInformationCard;
  @override
  Widget build(BuildContext context) {
    final List<_DotModel> listConnectedDots = _createListDotModel(connectedDot);
    final double screenHalfWidth = MediaQuery.of(context).size.width / 2;
    final List<_ConnectedLineModel> listConnectedLine = _createConnectLine(
      connectedLine,
      listConnectedDots,
      connectedDot.number,
      screenHalfWidth,
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _Buildtimeline(
                timeline: timeline,
                size: _getTimelineHeight(connectedDot),
              ),
              ...listConnectedLine.map(_buildConnectedLine),
              ...listConnectedDots.map(_buildConnectedDots),
              ..._buildInformationCard(
                  listInformationCard, screenHalfWidth, listConnectedLine),
            ],
          ),
        ),
      ),
    );
  }

  List<_ConnectedLineModel> _createConnectLine(ConnectedLine connectedLine,
      List<_DotModel> listConnectedDot, int size, double screenHalfWidth) {
    final List<_ConnectedLineModel> listConnectedline = <_ConnectedLineModel>[];
    for (int i = 0; i < size; i++) {
      final bool isLeft = i % 2 == 0;
      listConnectedline.add(
        _ConnectedLineModel(
          color: connectedLine.color,
          size: connectedLine.size,
          top: listConnectedDot.elementAt(i + 1).top + (connectedDotSize / 2),
          right:
              isLeft ? screenHalfWidth - connectedLine.size : screenHalfWidth,
          isLeft: isLeft,
        ),
      );
    }
    return listConnectedline;
  }

  List<_DotModel> _createListDotModel(ConnectedDot connectedDot) {
    final List<_DotModel> listDotModel = <_DotModel>[];
    double index = 1.0;
    listDotModel.add(
      _DotModel(
        color: connectedDot.edgeColor,
        top: 0,
        size: connectedDotSize,
      ),
    );

    for (int i = 0; i < connectedDot.number; i++) {
      listDotModel.add(
        _DotModel(
          color: connectedDot.middleColorDots,
          top: (index * connectedDot.spaceBetween) +
              (connectedDot.edgeSize - connectedDot.spaceBetween),
          size: connectedDotSize,
        ),
      );
      index++;
    }

    listDotModel.add(
      _DotModel(
        color: connectedDot.edgeColor,
        top: ((connectedDot.number - 1) * connectedDot.spaceBetween) +
            (connectedDot.edgeSize * 2),
        size: connectedDotSize,
      ),
    );

    return listDotModel;
  }

  double _getTimelineHeight(ConnectedDot connectedDot) {
    return ((connectedDot.number - 1) * connectedDot.spaceBetween) +
        (connectedDot.edgeSize * 2) +
        connectedDotSize;
  }
}
