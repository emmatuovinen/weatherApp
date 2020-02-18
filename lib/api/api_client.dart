import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/stats.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/apikey.dart';

Future<Stats> fetchStats() async {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/apiData.json');
  }

  String data = await loadAsset();

  var stringJsonData = '$data';
  var parsedData = ApiKey.fromJson(json.decode(stringJsonData));

  final String searchParam = 'Miami,us';

  final response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?q=' +
          searchParam +
          '&units=metric&' +
          parsedData.weatherKey);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Stats.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load stats');
  }
}
