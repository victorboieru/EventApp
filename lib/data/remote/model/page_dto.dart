class PageDTO {
  final int? size;
  final int? totalElements;
  final int? totalPages;
  final int? number;

  PageDTO({
    this.size,
    this.totalElements,
    this.totalPages,
    this.number,
  });

  factory PageDTO.fromJson(Map<String, dynamic> json) => PageDTO(
    size: json["size"],
    totalElements: json["totalElements"],
    totalPages: json["totalPages"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "size": size,
    "totalElements": totalElements,
    "totalPages": totalPages,
    "number": number,
  };
}
