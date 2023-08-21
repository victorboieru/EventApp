import 'dart:convert';

import 'package:event_app/data/remote/model/embedded_dto.dart';
import 'package:event_app/data/remote/model/links_dto.dart';
import 'package:event_app/data/remote/model/page_dto.dart';
import 'package:event_app/domain/model/event_response.dart';

EventsResponseDTO eventsResponseFromJson(String str) => EventsResponseDTO.fromJson(json.decode(str));

String eventsResponseToJson(EventsResponseDTO data) => json.encode(data.toJson());

class EventsResponseDTO {
  final EmbeddedDTO? embedded;
  final LinksDTO? links;
  final PageDTO? page;

  EventsResponseDTO({
    this.embedded,
    this.links,
    this.page,
  });

  factory EventsResponseDTO.fromJson(Map<String, dynamic> json) => EventsResponseDTO(
    embedded: json["_embedded"] == null ? null : EmbeddedDTO.fromJson(json["_embedded"]),
    links: json["_links"] == null ? null : LinksDTO.fromJson(json["_links"]),
    page: json["page"] == null ? null : PageDTO.fromJson(json["page"]),
  );

  Map<String, dynamic> toJson() => {
    "_embedded": embedded?.toJson(),
    "_links": links?.toJson(),
    "page": page?.toJson(),
  };

  EventsResponse toEventsResponse() {
    return EventsResponse(
      embedded: embedded?.toEmbedded()
    );
  }
}
