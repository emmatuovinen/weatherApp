class Stats {
  final String latitude;
  final String longitude;
  final int epochTime;
  final String currentTemperature;
  final String feelsLikeTemperature;
  final String timezone;
  final String currentWeatherCondition;

  Stats(
      {
      this.latitude,
      this.longitude,
      this.epochTime,
      this.currentTemperature,
      this.feelsLikeTemperature,
      this.timezone,
      this.currentWeatherCondition});

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      latitude: json['latitude'].toString(),
      longitude: json['longitude'].toString(),
      epochTime: json['currently']['time'],
      currentTemperature: json['currently']['temperature'].round().toString(),
      feelsLikeTemperature: json['currently']['apparentTemperature'].round().toString(),
      timezone: json['timezone'],
      currentWeatherCondition: json['currently']['summary'],
    );
  }
}
