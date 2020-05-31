part of '../journey_path.dart';

List<Widget> _buildInformationCard(
  InformationCard listInformationCard,
  double screenHalfWidth,
  List<_ConnectedLineModel> listConnectedLine,
) {
  final List<Widget> _list = <Widget>[];
  Widget card;
  int index = 0;

  for (final InformationCardDetails info in listInformationCard.list) {
    card = Positioned(
      right: listConnectedLine.elementAt(index).isLeft
          ? screenHalfWidth -
              (listInformationCard.width +
                  listConnectedLine.elementAt(index).size)
          : screenHalfWidth + listConnectedLine.elementAt(index).size,
      top: listConnectedLine.elementAt(index).top -
          (listInformationCard.height / 2),
      child: Container(
        decoration: BoxDecoration(
          color: listInformationCard.color,
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        width: listInformationCard.width,
        height: listInformationCard.height,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(info.name),
              if (info.description == null)
                Container()
              else
                Text(info.description),
            ],
          ),
        ),
      ),
    );
    _list.add(card);
    index++;
  }
  return _list;
}
