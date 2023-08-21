import 'package:event_app/data/remote/model/facebook_dto.dart';

class ExternalLinksDTO {
  final List<FacebookDTO>? twitter;
  final List<FacebookDTO>? wiki;
  final List<FacebookDTO>? facebook;
  final List<FacebookDTO>? instagram;
  final List<FacebookDTO>? homepage;

  ExternalLinksDTO({
    this.twitter,
    this.wiki,
    this.facebook,
    this.instagram,
    this.homepage,
  });

  factory ExternalLinksDTO.fromJson(Map<String, dynamic> json) => ExternalLinksDTO(
    twitter: json["twitter"] == null ? [] : List<FacebookDTO>.from(json["twitter"]!.map((x) => FacebookDTO.fromJson(x))),
    wiki: json["wiki"] == null ? [] : List<FacebookDTO>.from(json["wiki"]!.map((x) => FacebookDTO.fromJson(x))),
    facebook: json["facebook"] == null ? [] : List<FacebookDTO>.from(json["facebook"]!.map((x) => FacebookDTO.fromJson(x))),
    instagram: json["instagram"] == null ? [] : List<FacebookDTO>.from(json["instagram"]!.map((x) => FacebookDTO.fromJson(x))),
    homepage: json["homepage"] == null ? [] : List<FacebookDTO>.from(json["homepage"]!.map((x) => FacebookDTO.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "twitter": twitter == null ? [] : List<dynamic>.from(twitter!.map((x) => x.toJson())),
    "wiki": wiki == null ? [] : List<dynamic>.from(wiki!.map((x) => x.toJson())),
    "facebook": facebook == null ? [] : List<dynamic>.from(facebook!.map((x) => x.toJson())),
    "instagram": instagram == null ? [] : List<dynamic>.from(instagram!.map((x) => x.toJson())),
    "homepage": homepage == null ? [] : List<dynamic>.from(homepage!.map((x) => x.toJson())),
  };
}