import 'package:event_app/data/remote/model/self_dto.dart';

class EventDetailLinksDTO {
  SelfDTO? self;
  List<SelfDTO>? attractions;
  List<SelfDTO>? venues;

  EventDetailLinksDTO({
    this.self,
    this.attractions,
    this.venues,
  });

  factory EventDetailLinksDTO.fromJson(Map<String, dynamic> json) => EventDetailLinksDTO(
    self: json["self"] == null ? null : SelfDTO.fromJson(json["self"]),
    attractions: json["attractions"] == null ? [] : List<SelfDTO>.from(json["attractions"]!.map((x) => SelfDTO.fromJson(x))),
    venues: json["venues"] == null ? [] : List<SelfDTO>.from(json["venues"]!.map((x) => SelfDTO.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": self?.toJson(),
    "attractions": attractions == null ? [] : List<dynamic>.from(attractions!.map((x) => x.toJson())),
    "venues": venues == null ? [] : List<dynamic>.from(venues!.map((x) => x.toJson())),
  };
}
