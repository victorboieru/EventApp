import 'package:event_app/data/remote/model/genre_dto.dart';

class AttractionClassificationDTO {
  final bool? primary;
  final GenreDTO? segment;
  final GenreDTO? genre;
  final GenreDTO? subGenre;
  final GenreDTO? type;
  final GenreDTO? subType;
  final bool? family;

  AttractionClassificationDTO({
    this.primary,
    this.segment,
    this.genre,
    this.subGenre,
    this.type,
    this.subType,
    this.family,
  });

  factory AttractionClassificationDTO.fromJson(Map<String, dynamic> json) => AttractionClassificationDTO(
    primary: json["primary"],
    segment: json["segment"] == null ? null : GenreDTO.fromJson(json["segment"]),
    genre: json["genre"] == null ? null : GenreDTO.fromJson(json["genre"]),
    subGenre: json["subGenre"] == null ? null : GenreDTO.fromJson(json["subGenre"]),
    type: json["type"] == null ? null : GenreDTO.fromJson(json["type"]),
    subType: json["subType"] == null ? null : GenreDTO.fromJson(json["subType"]),
    family: json["family"],
  );

  Map<String, dynamic> toJson() => {
    "primary": primary,
    "segment": segment?.toJson(),
    "genre": genre?.toJson(),
    "subGenre": subGenre?.toJson(),
    "type": type?.toJson(),
    "subType": subType?.toJson(),
    "family": family,
  };
}