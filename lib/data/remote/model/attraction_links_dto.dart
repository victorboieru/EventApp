import 'package:event_app/data/remote/model/first_dto.dart';

class AttractionLinksDTO {
  final FirstDTO? self;

  AttractionLinksDTO({
    this.self,
  });

  factory AttractionLinksDTO.fromJson(Map<String, dynamic> json) => AttractionLinksDTO(
    self: json["self"] == null ? null : FirstDTO.fromJson(json["self"]),
  );

  Map<String, dynamic> toJson() => {
    "self": self?.toJson(),
  };
}