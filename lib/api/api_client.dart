import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/stats.dart';

Future<Stats> fetchStats() async {
  final String searchParam = 'Berlin,de';
  final String appid = 'APPID=67ffa7eb511365ace5f39980cc682f2d';

  final response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?q=' +
          searchParam +
          '&units=metric&' +
          appid);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Stats.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load stats');
  }
}
