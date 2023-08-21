import 'package:event_app/data/remote/model/sales_dto.dart';
import 'package:event_app/data/remote/model/dates_dto.dart';
import 'package:event_app/data/remote/model/image_dto.dart';
import 'package:event_app/data/remote/model/outlet_dto.dart';
import 'package:event_app/data/remote/model/seatmap_dto.dart';
import 'package:event_app/data/remote/model/event_embedded_dto.dart';
import 'package:event_app/data/remote/model/event_links_dto.dart';
import 'package:event_app/data/remote/model/event_classification_dto.dart';
import 'package:event_app/domain/model/event.dart';

class EventDTO {
  final String? name;
  final String? type;
  final String? id;
  final bool? test;
  final String? url;
  final String? locale;
  final List<ImageDTO>? images;
  final SalesDTO? sales;
  final DatesDTO dates;
  final List<EventClassificationDTO>? classifications;
  final List<OutletDTO>? outlets;
  final SeatmapDTO? seatmap;
  final EventLinksDTO? links;
  final EventEmbeddedDTO? embedded;

  EventDTO({
    this.name,
    this.type,
    this.id,
    this.test,
    this.url,
    this.locale,
    this.images,
    this.sales,
    required this.dates,
    this.classifications,
    this.outlets,
    this.seatmap,
    this.links,
    this.embedded,
  });

  factory EventDTO.fromJson(Map<String, dynamic> json) => EventDTO(
    name: json["name"],
    type: json["type"],
    id: json["id"],
    test: json["test"],
    url: json["url"],
    locale: json["locale"],
    images: json["images"] == null ? [] : List<ImageDTO>.from(json["images"]!.map((x) => ImageDTO.fromJson(x))),
    sales: json["sales"] == null ? null : SalesDTO.fromJson(json["sales"]),
    // dates: json["dates"] == null ? null : Dates.fromJson(json["dates"]),
    dates: DatesDTO.fromJson(json["dates"]),
    classifications: json["classifications"] == null ? [] : List<EventClassificationDTO>.from(json["classifications"]!.map((x) => EventClassificationDTO.fromJson(x))),
    outlets: json["outlets"] == null ? [] : List<OutletDTO>.from(json["outlets"]!.map((x) => OutletDTO.fromJson(x))),
    seatmap: json["seatmap"] == null ? null : SeatmapDTO.fromJson(json["seatmap"]),
    links: json["_links"] == null ? null : EventLinksDTO.fromJson(json["_links"]),
    embedded: json["_embedded"] == null ? null : EventEmbeddedDTO.fromJson(json["_embedded"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "id": id,
    "test": test,
    "url": url,
    "locale": locale,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "sales": sales?.toJson(),
    "dates": dates.toJson(),
    "classifications": classifications == null ? [] : List<dynamic>.from(classifications!.map((x) => x.toJson())),
    "outlets": outlets == null ? [] : List<dynamic>.from(outlets!.map((x) => x.toJson())),
    "seatmap": seatmap?.toJson(),
    "_links": links?.toJson(),
    "_embedded": embedded?.toJson(),
  };

  Event toEvent() {
    return Event(
        name: name,
        id: id,
        images: images?.map((e) => e.toImage()).toList(),
        dates: dates.toDates(),
        classifications: classifications?.map((e) => e.toEventClassification()).toList()
    );
  }
}