import 'package:event_app/data/remote/model/public_dto.dart';

class SalesDTO {
  final PublicDTO? public;

  SalesDTO({
    this.public,
  });

  factory SalesDTO.fromJson(Map<String, dynamic> json) => SalesDTO(
    public: json["public"] == null ? null : PublicDTO.fromJson(json["public"]),
  );

  Map<String, dynamic> toJson() => {
    "public": public?.toJson(),
  };
}