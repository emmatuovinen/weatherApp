class LocationDetails {
  final String latitude;
  final String longitude;
  final String name;

  LocationDetails(
      {
      this.latitude,
      this.longitude,
      this.name});

  factory LocationDetails.fromJson(Map<String, dynamic> json) {
    return LocationDetails(
      latitude: json['results'][0]['geometry']['location']['lat'].toString(),
      longitude: json['results'][0]['geometry']['location']['lng'].toString(),
      name: json['results'][0]['name'],
    );
  }
}
