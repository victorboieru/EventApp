class PromoterDTO {
  String? id;
  String? name;
  String? description;

  PromoterDTO({
    this.id,
    this.name,
    this.description,
  });

  factory PromoterDTO.fromJson(Map<String, dynamic> json) => PromoterDTO(
    id: json["id"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}
