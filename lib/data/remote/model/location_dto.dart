class LocationDTO {
  final String? longitude;
  final String? latitude;

  LocationDTO({
    this.longitude,
    this.latitude,
  });

  factory LocationDTO.fromJson(Map<String, dynamic> json) => LocationDTO(
    longitude: json["longitude"],
    latitude: json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "longitude": longitude,
    "latitude": latitude,
  };
}