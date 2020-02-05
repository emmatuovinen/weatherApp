import 'package:flutter/material.dart';
import '../models/stats.dart';
import '../api/api_client.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key:key);
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
        appBar: AppBar(
            centerTitle: true, 
            title: Text('Welcome to Weather App')),
        body: ListView(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange
              ),
            ),
            Container(
              child: FutureBuilder<Stats>(
                future: stats,
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Text(
                            snapshot.data.city,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            new DateFormat.MMMd().add_Hm().format(new DateTime.now()),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
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
                            'Feels like ' + snapshot.data.feelsLikeTemperature + ' °C',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ]
                      )
                    );
                  }
                })
            )
          ]
        )
      );
}

