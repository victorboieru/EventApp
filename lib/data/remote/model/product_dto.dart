import 'package:event_app/data/remote/model/event_classification_dto.dart';

class ProductDTO {
  String? name;
  String? id;
  String? url;
  String? type;
  List<EventClassificationDTO>? classifications;

  ProductDTO({
    this.name,
    this.id,
    this.url,
    this.type,
    this.classifications,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) => ProductDTO(
    name: json["name"],
    id: json["id"],
    url: json["url"],
    type: json["type"],
    classifications: json["classifications"] == null ? [] : List<EventClassificationDTO>.from(json["classifications"]!.map((x) => EventClassificationDTO.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "url": url,
    "type": type,
    "classifications": classifications == null ? [] : List<dynamic>.from(classifications!.map((x) => x.toJson())),
  };
}