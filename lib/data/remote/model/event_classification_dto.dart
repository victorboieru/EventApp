import 'package:event_app/data/remote/model/genre_dto.dart';
import 'package:event_app/domain/model/event_classification.dart';

class EventClassificationDTO {
  final bool? primary;
  final GenreDTO? segment;
  final GenreDTO? genre;
  final GenreDTO? subGenre;
  final bool? family;

  EventClassificationDTO({
    this.primary,
    this.segment,
    this.genre,
    this.subGenre,
    this.family,
  });

  factory EventClassificationDTO.fromJson(Map<String, dynamic> json) => EventClassificationDTO(
    primary: json["primary"],
    segment: json["segment"] == null ? null : GenreDTO.fromJson(json["segment"]),
    genre: json["genre"] == null ? null : GenreDTO.fromJson(json["genre"]),
    subGenre: json["subGenre"] == null ? null : GenreDTO.fromJson(json["subGenre"]),
    family: json["family"],
  );

  Map<String, dynamic> toJson() => {
    "primary": primary,
    "segment": segment?.toJson(),
    "genre": genre?.toJson(),
    "subGenre": subGenre?.toJson(),
    "family": family,
  };

  EventClassification toEventClassification() {
    return EventClassification(
      primary: primary,
      segment: segment?.toGenre(),
      genre: genre?.toGenre(),
      subGenre: subGenre?.toGenre(),
      family: family
    );
  }
}