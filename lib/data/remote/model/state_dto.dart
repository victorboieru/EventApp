class StateDTO {
  final String? name;
  final String? stateCode;

  StateDTO({
    this.name,
    this.stateCode,
  });

  factory StateDTO.fromJson(Map<String, dynamic> json) => StateDTO(
    name: json["name"],
    stateCode: json["stateCode"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "stateCode": stateCode,
  };
}