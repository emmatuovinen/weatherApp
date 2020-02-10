import 'package:flutter/material.dart';
import '../models/stats.dart';
import '../api/api_client.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Stats> stats;
  @override
  void initState() {
    debugPrint(new DateFormat.yMMMd().format(new DateTime.now()));
    super.initState();
    stats = fetchStats();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar:
            AppBar(centerTitle: true, title: Text('Welcome to Weather App')),
        body: ListView(
          children: [
            //We can use stack to overlay different images
            Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  color: Colors.cyan[100],
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.orange),
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
            ),
            Container(
              height: 220,
              child: FutureBuilder<Stats>(
                future: stats,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Text(
                            snapshot.data.city.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                new DateFormat.E().format(new DateTime.now()),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                height: 20,
                                child: VerticalDivider(
                                  thickness: 2.0,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                new DateFormat.MMMd()
                                    .format(new DateTime.now()),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                height: 20,
                                child: VerticalDivider(
                                  thickness: 2.0,
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
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              VerticalDivider(),
                            ],
                          ),
                          Text(
                            snapshot.data.currentWeatherCondition,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            snapshot.data.currentTemperature + ' °C',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
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
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 40.0,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 40.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
