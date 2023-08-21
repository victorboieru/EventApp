import 'package:event_app/data/remote/model/first_dto.dart';

class EventLinksDTO {
  final FirstDTO? self;
  final List<FirstDTO>? attractions;
  final List<FirstDTO>? venues;

  EventLinksDTO({
    this.self,
    this.attractions,
    this.venues,
  });

  factory EventLinksDTO.fromJson(Map<String, dynamic> json) => EventLinksDTO(
    self: json["self"] == null ? null : FirstDTO.fromJson(json["self"]),
    attractions: json["attractions"] == null ? [] : List<FirstDTO>.from(json["attractions"]!.map((x) => FirstDTO.fromJson(x))),
    venues: json["venues"] == null ? [] : List<FirstDTO>.from(json["venues"]!.map((x) => FirstDTO.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": self?.toJson(),
    "attractions": attractions == null ? [] : List<dynamic>.from(attractions!.map((x) => x.toJson())),
    "venues": venues == null ? [] : List<dynamic>.from(venues!.map((x) => x.toJson())),
  };
}