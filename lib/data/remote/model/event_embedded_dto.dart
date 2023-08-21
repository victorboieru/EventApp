import 'package:event_app/data/remote/model/venue_dto.dart';
import 'package:event_app/data/remote/model/attraction_dto.dart';

class EventEmbeddedDTO {
  final List<VenueDTO>? venues;
  final List<AttractionDTO>? attractions;

  EventEmbeddedDTO({
    this.venues,
    this.attractions,
  });

  factory EventEmbeddedDTO.fromJson(Map<String, dynamic> json) => EventEmbeddedDTO(
    venues: json["venues"] == null ? [] : List<VenueDTO>.from(json["venues"]!.map((x) => VenueDTO.fromJson(x))),
    attractions: json["attractions"] == null ? [] : List<AttractionDTO>.from(json["attractions"]!.map((x) => AttractionDTO.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "venues": venues == null ? [] : List<dynamic>.from(venues!.map((x) => x.toJson())),
    "attractions": attractions == null ? [] : List<dynamic>.from(attractions!.map((x) => x.toJson())),
  };
}