class FacebookDTO {
  final String? url;

  FacebookDTO({
    this.url,
  });

  factory FacebookDTO.fromJson(Map<String, dynamic> json) => FacebookDTO(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}