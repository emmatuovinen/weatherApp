import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/stats.dart';
import 'secret.dart';


Future<Stats> fetchStats() async {
  final String searchParam = 'Boston,us';
  //final ApiKeys apikeys;

  final response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?q=' +
          searchParam +
          '&units=metric&' );
          //+ apikeys.weatherApi);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Stats.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load stats');
  }
}
