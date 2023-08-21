import 'package:event_app/data/remote/model/image_dto.dart';
import 'package:event_app/data/remote/model/upcoming_events_dto.dart';
import 'package:event_app/data/remote/model/attraction_links_dto.dart';
import 'package:event_app/data/remote/model/attraction_classification_dto.dart';
import 'package:event_app/data/remote/model/external_links_dto.dart';

class AttractionDTO {
  final String? name;
  final String? type;
  final String? id;
  final bool? test;
  final String? url;
  final String? locale;
  final ExternalLinksDTO? externalLinks;
  final List<ImageDTO>? images;
  final List<AttractionClassificationDTO>? classifications;
  final UpcomingEventsDTO? upcomingEvents;
  final AttractionLinksDTO? links;
  final List<String>? aliases;

  AttractionDTO({
    this.name,
    this.type,
    this.id,
    this.test,
    this.url,
    this.locale,
    this.externalLinks,
    this.images,
    this.classifications,
    this.upcomingEvents,
    this.links,
    this.aliases,
  });

  factory AttractionDTO.fromJson(Map<String, dynamic> json) => AttractionDTO(
    name: json["name"],
    type: json["type"],
    id: json["id"],
    test: json["test"],
    url: json["url"],
    locale: json["locale"],
    externalLinks: json["externalLinks"] == null ? null : ExternalLinksDTO.fromJson(json["externalLinks"]),
    images: json["images"] == null ? [] : List<ImageDTO>.from(json["images"]!.map((x) => ImageDTO.fromJson(x))),
    classifications: json["classifications"] == null ? [] : List<AttractionClassificationDTO>.from(json["classifications"]!.map((x) => AttractionClassificationDTO.fromJson(x))),
    upcomingEvents: json["upcomingEvents"] == null ? null : UpcomingEventsDTO.fromJson(json["upcomingEvents"]),
    links: json["_links"] == null ? null : AttractionLinksDTO.fromJson(json["_links"]),
    aliases: json["aliases"] == null ? [] : List<String>.from(json["aliases"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "id": id,
    "test": test,
    "url": url,
    "locale": locale,
    "externalLinks": externalLinks?.toJson(),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "classifications": classifications == null ? [] : List<dynamic>.from(classifications!.map((x) => x.toJson())),
    "upcomingEvents": upcomingEvents?.toJson(),
    "_links": links?.toJson(),
    "aliases": aliases == null ? [] : List<dynamic>.from(aliases!.map((x) => x)),
  };
}