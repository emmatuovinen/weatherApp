import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/stats.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/apikey.dart';
import '../models/location.dart';

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/apiData.json');
}

Future<Stats> fetchStats(latitude, longitude) async {

  String data = await loadAsset();
  var stringJsonData = '$data';
  var parsedData = ApiKey.fromJson(json.decode(stringJsonData));

  final response = await http.get('https://api.darksky.net/forecast/' +
      parsedData.darkSky +
      '/$latitude,$longitude?units=si');
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Stats.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load stats');
  }
}

Future<LocationDetails> locationSearchByCoordinates(latitude, longitude) async {
  String data = await loadAsset();
  var stringJsonData = '$data';
  var parsedData = ApiKey.fromJson(json.decode(stringJsonData));

  print(latitude);

  String url =
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=1000&key=${parsedData.googleKey}';

  print(url);

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print(data);
    return LocationDetails.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load stats');
  }
}

Future<LocationDetails> locationSearchByString(String searchParam) async {
  String data = await loadAsset();

  var stringJsonData = '$data';
  var parsedData = ApiKey.fromJson(json.decode(stringJsonData));

  String url =
      'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$searchParam&key=${parsedData.googleKey}';

  print(url);

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print(data);
    return LocationDetails.fromJson(json.decode(response.body));
  } else {
    throw Exception('An error occurred');
  }
}
