import 'package:event_app/domain/model/genre.dart';

class GenreDTO {
  final String id;
  final String name;

  GenreDTO({
    required this.id,
    required this.name,
  });

  factory GenreDTO.fromJson(Map<String, dynamic> json) => GenreDTO(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

  Genre toGenre() {
    return Genre(
      id: id,
      name: name
    );
  }
}