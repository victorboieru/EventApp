class SeatmapDTO {
  final String? staticUrl;

  SeatmapDTO({
    this.staticUrl,
  });

  factory SeatmapDTO.fromJson(Map<String, dynamic> json) => SeatmapDTO(
    staticUrl: json["staticUrl"],
  );

  Map<String, dynamic> toJson() => {
    "staticUrl": staticUrl,
  };
}