class CityDTO {
  final String? name;

  CityDTO({
    this.name,
  });

  factory CityDTO.fromJson(Map<String, dynamic> json) => CityDTO(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}