library journey_path;

import 'package:flutter/material.dart';
import 'package:journey_path/models/connected_line.dart';

import 'models/models.dart';

class JourneyPath extends StatelessWidget {
  final double connectedDotSize = 24.0;
  final Timeline timeline;
  final ConnectedDot connectedDot;
  final ConnectedLine connectedLine;
  const JourneyPath({
    @required this.timeline,
    @required this.connectedDot,
    @required this.connectedLine,
  });
  @override
  Widget build(BuildContext context) {
    List<_DotModel> listConnectedDots = _createListDotModel(connectedDot);
    final double screenHalfWidth = MediaQuery.of(context).size.width / 2;
    List<_ConnectedLineModel> listConnectedLine = _createConnectLine(
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
              ],
            )),
      ),
    );
  }

  List<_DotModel> _createListDotModel(ConnectedDot connectedDot) {
    List<_DotModel> listDotModel = List<_DotModel>();
    var index = 1.0;
    listDotModel.add(
      _DotModel(
        color: connectedDot.edgeColor,
        top: 0,
        size: connectedDotSize,
      ),
    );

    for (var i = 0; i < connectedDot.number; i++) {
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

  List<_ConnectedLineModel> _createConnectLine(ConnectedLine connectedLine,
      List<_DotModel> listConnectedDot, int size, double screenHalfWidth) {
    List<_ConnectedLineModel> listConnectedline = List<_ConnectedLineModel>();
    for (var i = 0; i < size; i++) {
      bool isLeft = i % 2 == 0;
      listConnectedline.add(
        _ConnectedLineModel(
          color: connectedLine.color,
          size: connectedLine.size,
          top: listConnectedDot.elementAt(i + 1).top + (connectedDotSize / 2),
          right:
              isLeft ? screenHalfWidth - connectedLine.size : screenHalfWidth,
        ),
      );
    }
    return listConnectedline;
  }
}

class _ConnectedLineModel {
  final double size;
  final Color color;
  final double top;
  final double right;

  const _ConnectedLineModel({
    @required this.size,
    @required this.color,
    @required this.top,
    @required this.right,
  });
}

Widget _buildConnectedLine(_ConnectedLineModel connectedLine) {
  return Positioned(
    right: connectedLine.right,
    top: connectedLine.top,
    child: Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Container(
          height: 2,
          width: connectedLine.size,
          color: connectedLine.color,
        ),
      ],
    ),
  );
}

class _DotModel {
  final double top;
  final double size;
  final Color color;

  const _DotModel({
    @required this.color,
    @required this.size,
    @required this.top,
  });
}

Widget _buildConnectedDots(_DotModel dotModel) {
  return Positioned(
    top: dotModel.top,
    child: Container(
      height: dotModel.size,
      width: dotModel.size,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFDDDDDD), width: 1.0)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: dotModel.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    ),
  );
}

class _Buildtimeline extends StatelessWidget {
  final Timeline timeline;
  final double size;
  const _Buildtimeline({
    @required this.timeline,
    @required this.size,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: timeline.thickness,
          height: size,
          color: timeline.color,
        ),
      ],
    );
  }
}
