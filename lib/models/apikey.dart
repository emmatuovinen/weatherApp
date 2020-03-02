class ApiKey {
  String weatherKey;
  String googleKey;
  String darkSky;

  ApiKey({this.weatherKey, this.googleKey, this.darkSky});

  ApiKey.fromJson(Map<String, dynamic> json)
      : weatherKey = json['weatherApiKey'],
        googleKey = json['googleApiKey'],
        darkSky = json['darkSkyKey'];
}
