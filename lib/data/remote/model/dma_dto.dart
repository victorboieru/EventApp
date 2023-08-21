class DmaDTO {
  final int? id;

  DmaDTO({
    this.id,
  });

  factory DmaDTO.fromJson(Map<String, dynamic> json) => DmaDTO(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}