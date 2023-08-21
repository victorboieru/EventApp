import 'dart:convert';
import 'package:event_app/data/remote/model/image_dto.dart';
import 'package:event_app/data/remote/model/sales_dto.dart';
import 'package:event_app/data/remote/model/dates_dto.dart';
import 'package:event_app/data/remote/model/event_classification_dto.dart';
import 'package:event_app/data/remote/model/embedded_dto.dart';
import 'package:event_app/data/remote/model/seatmap_dto.dart';
import 'package:event_app/data/remote/model/promoter_dto.dart';
import 'package:event_app/data/remote/model/price_range_dto.dart';
import 'package:event_app/data/remote/model/product_dto.dart';
import 'package:event_app/data/remote/model/accessibility_dto.dart';
import 'package:event_app/data/remote/model/ticket_limit_dto.dart';
import 'package:event_app/data/remote/model/age_restrictions_dto.dart';
import 'package:event_app/data/remote/model/ticketing_dto.dart';
import 'package:event_app/data/remote/model/event_detailL_links_dto.dart';
import 'package:event_app/domain/model/event_details.dart';

EventDetailDTO eventDetailFromJson(String str) => EventDetailDTO.fromJson(json.decode(str));

String eventDetailToJson(EventDetailDTO data) => json.encode(data.toJson());

class EventDetailDTO {
  String? name;
  String? type;
  String? id;
  bool? test;
  String? url;
  String? locale;
  List<ImageDTO>? images;
  SalesDTO? sales;
  DatesDTO? dates;
  List<EventClassificationDTO>? classifications;
  PromoterDTO? promoter;
  List<PromoterDTO>? promoters;
  String? info;
  String? pleaseNote;
  List<PriceRangeDTO>? priceRanges;
  List<ProductDTO>? products;
  SeatmapDTO? seatmap;
  AccessibilityDTO? accessibility;
  TicketLimitDTO? ticketLimit;
  AgeRestrictionsDTO? ageRestrictions;
  TicketingDTO? ticketing;
  EventDetailLinksDTO? links;
  EmbeddedDTO? embedded;

  EventDetailDTO({
    this.name,
    this.type,
    this.id,
    this.test,
    this.url,
    this.locale,
    this.images,
    this.sales,
    this.dates,
    this.classifications,
    this.promoter,
    this.promoters,
    this.info,
    this.pleaseNote,
    this.priceRanges,
    this.products,
    this.seatmap,
    this.accessibility,
    this.ticketLimit,
    this.ageRestrictions,
    this.ticketing,
    this.links,
    this.embedded,
  });

  factory EventDetailDTO.fromJson(Map<String, dynamic> json) => EventDetailDTO(
    name: json["name"],
    type: json["type"],
    id: json["id"],
    test: json["test"],
    url: json["url"],
    locale: json["locale"],
    images: json["images"] == null ? [] : List<ImageDTO>.from(json["images"]!.map((x) => ImageDTO.fromJson(x))),
    sales: json["sales"] == null ? null : SalesDTO.fromJson(json["sales"]),
    dates: json["dates"] == null ? null : DatesDTO.fromJson(json["dates"]),
    classifications: json["classifications"] == null ? [] : List<EventClassificationDTO>.from(json["classifications"]!.map((x) => EventClassificationDTO.fromJson(x))),
    promoter: json["promoter"] == null ? null : PromoterDTO.fromJson(json["promoter"]),
    promoters: json["promoters"] == null ? [] : List<PromoterDTO>.from(json["promoters"]!.map((x) => PromoterDTO.fromJson(x))),
    info: json["info"],
    pleaseNote: json["pleaseNote"],
    priceRanges: json["priceRanges"] == null ? [] : List<PriceRangeDTO>.from(json["priceRanges"]!.map((x) => PriceRangeDTO.fromJson(x))),
    products: json["products"] == null ? [] : List<ProductDTO>.from(json["products"]!.map((x) => ProductDTO.fromJson(x))),
    seatmap: json["seatmap"] == null ? null : SeatmapDTO.fromJson(json["seatmap"]),
    accessibility: json["accessibility"] == null ? null : AccessibilityDTO.fromJson(json["accessibility"]),
    ticketLimit: json["ticketLimit"] == null ? null : TicketLimitDTO.fromJson(json["ticketLimit"]),
    ageRestrictions: json["ageRestrictions"] == null ? null : AgeRestrictionsDTO.fromJson(json["ageRestrictions"]),
    ticketing: json["ticketing"] == null ? null : TicketingDTO.fromJson(json["ticketing"]),
    links: json["_links"] == null ? null : EventDetailLinksDTO.fromJson(json["_links"]),
    embedded: json["_embedded"] == null ? null : EmbeddedDTO.fromJson(json["_embedded"]),
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
    "dates": dates?.toJson(),
    "classifications": classifications == null ? [] : List<dynamic>.from(classifications!.map((x) => x.toJson())),
    "promoter": promoter?.toJson(),
    "promoters": promoters == null ? [] : List<dynamic>.from(promoters!.map((x) => x.toJson())),
    "info": info,
    "pleaseNote": pleaseNote,
    "priceRanges": priceRanges == null ? [] : List<dynamic>.from(priceRanges!.map((x) => x.toJson())),
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "seatmap": seatmap?.toJson(),
    "accessibility": accessibility?.toJson(),
    "ticketLimit": ticketLimit?.toJson(),
    "ageRestrictions": ageRestrictions?.toJson(),
    "ticketing": ticketing?.toJson(),
    "_links": links?.toJson(),
    "_embedded": embedded?.toJson(),
  };

  EventDetails toEventDetails() {
    return EventDetails(
        name: name,
        type: type,
        id: id,
        test: test,
        url: url,
        locale: locale,
        info: info,
        pleaseNote: pleaseNote
    );
  }
}