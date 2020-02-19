class Stats {
  final int id;
  final String city;
  final String currentTemperature;
  final String feelsLikeTemperature;
  final int timezone;
  final String currentWeatherCondition;
  final String countryCode;

  Stats(
      {this.id,
      this.city,
      this.currentTemperature,
      this.feelsLikeTemperature,
      this.timezone,
      this.currentWeatherCondition,
      this.countryCode});

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      id: json['id'],
      city: json['name'],
      currentTemperature: json['main']['temp'].round().toString(),
      feelsLikeTemperature: json['main']['feels_like'].round().toString(),
      timezone: json['timezone'],
      currentWeatherCondition: json['weather'][0]['main'],
      countryCode: json['sys']['country'].toString(),
    );
  }
}
