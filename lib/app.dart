import 'package:flutter/material.dart';
import 'screens/home.dart';

import 'package:google_fonts/google_fonts.dart';

// TimeMachine discovers your TimeZone heuristically (it's actually pretty fast).
class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primaryColor: Colors.grey,
        accentColor: Colors.pink,
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Home(),
    );
  }
}
