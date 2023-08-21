class OutletDTO {
  final String? url;
  final String? type;

  OutletDTO({
    this.url,
    this.type,
  });

  factory OutletDTO.fromJson(Map<String, dynamic> json) => OutletDTO(
    url: json["url"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "type": type,
  };
}