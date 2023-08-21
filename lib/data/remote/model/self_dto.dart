class SelfDTO {
  String? href;

  SelfDTO({
    this.href,
  });

  factory SelfDTO.fromJson(Map<String, dynamic> json) => SelfDTO(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}