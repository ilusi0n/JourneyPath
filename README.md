# JourneyPath Package

A flutter package that draws a simple journey path with informational cards.
If you have more cards than can appear on screen do not worry! It's a scrollable widget!

## Screenshots

<img src="https://github.com/ilusi0n/JourneyPath/blob/master/screenshot.png?raw=true" height="500px">

## How to use?

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  journey_path: ^1.0.1
```

## Usage

You are going to need to create a timeline (e.g the verical line which you can specify the color and the thickness of the line).

```dart
final Timeline timeline = Timeline(
    color: Colors.grey,
    thickness: 2.0,
  );
```

You will have to specify the dot that will be in top of the vertical line. You can specify the color of which will stay at begin and at the end with the edgeColor. Also the space from the next dots.
You can specify the size between all the middles dots and it's colors.

```dart
  final ConnectedDot connectedDot = ConnectedDot(
    number: 4,
    edgeColor: Colors.red,
    spaceBetween: 150.0,
    edgeSize: 70,
    middleColorDots: Colors.green,
  );
);
```

Right here you want to customize the lines of which dot that will connect to each card.

```dart
  final ConnectedLine connectedLine = ConnectedLine(
    size: 30,
    color: Colors.grey,
  );
```

Finally specify of what you want to put on the cards, their size and color

```dart
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
```

And then put it all together!

```dart
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
```

## Contributing

Pull requests and improvements are welcome!

## LICENSE

MIT Licence
