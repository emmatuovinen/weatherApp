import 'package:flutter/material.dart';
import 'package:time_machine/time_machine.dart';
import '../models/stats.dart';
import '../api/api_client.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'imageStack.dart';

class CurrentLocation extends StatefulWidget {
  CurrentLocation({Key key}) : super(key: key);
  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

void _setTimeZone() async {
  print('Timezonesta moi');

  var now = Instant.now();

  await TimeMachine.initialize({'rootBundle': rootBundle});
  debugPrint('UTC time: $now');
}

class _CurrentLocationState extends State<CurrentLocation> {
  Future<Stats> stats;
  ImageStack imageStack;
  @override
  void initState() {
    debugPrint(new DateFormat.yMMMd().format(new DateTime.now()));
    super.initState();
    _setTimeZone();
    stats = fetchStats();
    imageStack = ImageStack();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        imageStack,
        //We can use stack to overlay different images
        // Stack(
        //   children: <Widget>[
        //     Container(
        //       height: 200,
        //       color: Colors.cyan[100],
        //     ),
        //     Container(
        //       height: 200,
        //       decoration:
        //           BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
        //     ),
        //     Container(
        //       height: 100,
        //       decoration:
        //           BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        //     ),
        //     Container(
        //       height: 50,
        //       decoration:
        //           BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        //     ),
        //     Container(
        //       child: FutureBuilder<Stats>(
        //           future: stats,
        //           builder: (context, snapshot) {
        //             switch (snapshot.data.currentWeatherCondition) {
        //               case 'Rain':
        //                 return SvgPicture.asset('images/heart.svg');
        //               case 'Clouds':
        //                 return SvgPicture.asset('images/clouds.svg');
        //               case 'Sun':
        //                 return SvgPicture.asset('images/sun.svg');
        //             }

        //             return Padding(
        //               padding: const EdgeInsets.all(10.0),
        //               child: Center(
        //                   child: Container(
        //                       height: 150,
        //                       width: 150,
        //                       child: CircularProgressIndicator())),
        //             );
        //           }),
        //     ),
        //   ],
        // ),
        Container(
          child: FutureBuilder<Stats>(
            future: stats,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          snapshot.data.city.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            new DateFormat.E()
                                .format(new DateTime.now())
                                .toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            height: 15,
                            child: VerticalDivider(
                              thickness: 1.0,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            new DateFormat.MMMd()
                                .format(new DateTime.now())
                                .toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            height: 15,
                            child: VerticalDivider(
                              thickness: 1.0,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            new DateFormat.Hm()
                                // .add_Hm()
                                .format(new DateTime.now()),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            snapshot.data.countryCode,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        snapshot.data.currentWeatherCondition,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        snapshot.data.currentTemperature + ' °C',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Feels like ' +
                            snapshot.data.feelsLikeTemperature +
                            ' °C',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Container(
                        height: 150,
                        width: 150,
                        child: CircularProgressIndicator())),
              );
            },
          ),
        ),
      ],
    );
  }
}
