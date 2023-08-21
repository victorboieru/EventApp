import 'package:event_app/data/remote/model/city_dto.dart';
import 'package:event_app/data/remote/model/state_dto.dart';
import 'package:event_app/data/remote/model/country_dto.dart';
import 'package:event_app/data/remote/model/address_dto.dart';
import 'package:event_app/data/remote/model/location_dto.dart';
import 'package:event_app/data/remote/model/dma_dto.dart';
import 'package:event_app/data/remote/model/upcoming_events_dto.dart';
import 'package:event_app/data/remote/model/attraction_links_dto.dart';

class VenueDTO {
  final String? name;
  final String? type;
  final String? id;
  final bool? test;
  final String? locale;
  final String? postalCode;
  final String? timezone;
  final CityDTO? city;
  final StateDTO? state;
  final CountryDTO? country;
  final AddressDTO? address;
  final LocationDTO? location;
  final List<DmaDTO>? dmas;
  final UpcomingEventsDTO? upcomingEvents;
  final AttractionLinksDTO? links;

  VenueDTO({
    this.name,
    this.type,
    this.id,
    this.test,
    this.locale,
    this.postalCode,
    this.timezone,
    this.city,
    this.state,
    this.country,
    this.address,
    this.location,
    this.dmas,
    this.upcomingEvents,
    this.links,
  });

  factory VenueDTO.fromJson(Map<String, dynamic> json) => VenueDTO(
    name: json["name"],
    type: json["type"],
    id: json["id"],
    test: json["test"],
    locale: json["locale"],
    postalCode: json["postalCode"],
    timezone: json["timezone"],
    city: json["city"] == null ? null : CityDTO.fromJson(json["city"]),
    state: json["state"] == null ? null : StateDTO.fromJson(json["state"]),
    country: json["country"] == null ? null : CountryDTO.fromJson(json["country"]),
    address: json["address"] == null ? null : AddressDTO.fromJson(json["address"]),
    location: json["location"] == null ? null : LocationDTO.fromJson(json["location"]),
    dmas: json["dmas"] == null ? [] : List<DmaDTO>.from(json["dmas"]!.map((x) => DmaDTO.fromJson(x))),
    upcomingEvents: json["upcomingEvents"] == null ? null : UpcomingEventsDTO.fromJson(json["upcomingEvents"]),
    links: json["_links"] == null ? null : AttractionLinksDTO.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "id": id,
    "test": test,
    "locale": locale,
    "postalCode": postalCode,
    "timezone": timezone,
    "city": city?.toJson(),
    "state": state?.toJson(),
    "country": country?.toJson(),
    "address": address?.toJson(),
    "location": location?.toJson(),
    "dmas": dmas == null ? [] : List<dynamic>.from(dmas!.map((x) => x.toJson())),
    "upcomingEvents": upcomingEvents?.toJson(),
    "_links": links?.toJson(),
  };
}