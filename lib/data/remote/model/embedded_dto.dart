import 'package:event_app/data/remote/model/event_dto.dart';
import 'package:event_app/domain/model/embedded.dart';

class EmbeddedDTO {
  final List<EventDTO>? events;

  EmbeddedDTO({
    this.events,
  });

  factory EmbeddedDTO.fromJson(Map<String, dynamic> json) => EmbeddedDTO(
    events: json["events"] == null ? [] : List<EventDTO>.from(json["events"]!.map((x) => EventDTO.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "events": events == null ? [] : List<dynamic>.from(events!.map((x) => x.toJson())),
  };

  Embedded toEmbedded() {
    return Embedded(
      events: events?.map((e) => e.toEvent()).toList()
    );
  }
}