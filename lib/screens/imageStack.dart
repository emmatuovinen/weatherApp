import 'package:flutter/material.dart';
import 'package:weather_app/models/location.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import '../models/stats.dart';
import '../api/api_client.dart';
// import 'package:flutter/services.dart';

class ImageStack extends StatefulWidget {
  ImageStack({Key key}) : super(key: key);
  @override
  _ImageStackState createState() => _ImageStackState();
}

class _ImageStackState extends State<ImageStack> {
  Future<Stats> stats;
  Future<LocationDetails> location;
  String weatherCondition;
  MaterialColor bigCircleColor = Colors.yellow;
  MaterialColor bgColor = Colors.cyan;
  int zero = 0;
  @override
  void initState() {
    super.initState();
    stats = fetchStats(initialLatitude, initialLongitude);
    location = locationSearchByCoordinates(initialLatitude, initialLongitude);
  }

  final String initialLatitude = '17.9970207';
  final String initialLongitude = '-76.7935791';

  void changeBgColor(int temp) {
    if (temp > 0) {
      bgColor = Colors.green;
    } else {
      bgColor = Colors.pink;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Stats>(
        future: stats,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            changeBgColor(snapshot.data.currentTemperatureInt);
            switch (snapshot.data.currentWeatherCondition) {
              case 'Clouds':
                bigCircleColor = Colors.yellow;
                break;
              case 'Rain':
                bigCircleColor = Colors.lime;
                break;
              default:
                bigCircleColor = Colors.pink;
            }

            return Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  color: bgColor,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: bigCircleColor),
                ),
                Container(
                  height: 100,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
