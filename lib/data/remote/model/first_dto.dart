class FirstDTO {
  final String? href;

  FirstDTO({
    this.href,
  });

  factory FirstDTO.fromJson(Map<String, dynamic> json) => FirstDTO(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}