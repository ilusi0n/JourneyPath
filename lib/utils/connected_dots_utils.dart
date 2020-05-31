part of '../journey_path.dart';

class _DotModel {
  const _DotModel({
    @required this.color,
    @required this.size,
    @required this.top,
  });
  final double top;
  final double size;
  final Color color;
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
  const _Buildtimeline({
    @required this.timeline,
    @required this.size,
  });
  final Timeline timeline;
  final double size;

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
