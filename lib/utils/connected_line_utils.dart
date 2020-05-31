part of '../journey_path.dart';

class _ConnectedLineModel {
  const _ConnectedLineModel({
    @required this.size,
    @required this.color,
    @required this.top,
    @required this.right,
    @required this.isLeft,
  });
  final double size;
  final Color color;
  final double top;
  final double right;
  final bool isLeft;
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
