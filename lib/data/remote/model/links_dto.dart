import 'package:event_app/data/remote/model/first_dto.dart';

class LinksDTO {
  final FirstDTO? first;
  final FirstDTO? self;
  final FirstDTO? next;
  final FirstDTO? last;

  LinksDTO({
    this.first,
    this.self,
    this.next,
    this.last,
  });

  factory LinksDTO.fromJson(Map<String, dynamic> json) => LinksDTO(
    first: json["first"] == null ? null : FirstDTO.fromJson(json["first"]),
    self: json["self"] == null ? null : FirstDTO.fromJson(json["self"]),
    next: json["next"] == null ? null : FirstDTO.fromJson(json["next"]),
    last: json["last"] == null ? null : FirstDTO.fromJson(json["last"]),
  );

  Map<String, dynamic> toJson() => {
    "first": first?.toJson(),
    "self": self?.toJson(),
    "next": next?.toJson(),
    "last": last?.toJson(),
  };
}