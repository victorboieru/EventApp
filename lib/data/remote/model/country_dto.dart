class CountryDTO {
  final String? name;
  final String? countryCode;

  CountryDTO({
    this.name,
    this.countryCode,
  });

  factory CountryDTO.fromJson(Map<String, dynamic> json) => CountryDTO(
    name: json["name"],
    countryCode: json["countryCode"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "countryCode": countryCode,
  };
}