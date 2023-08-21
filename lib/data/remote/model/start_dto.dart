import 'package:event_app/domain/model/start.dart';

class StartDTO {
  final DateTime? localDate;
  final String? localTime;
  final DateTime? dateTime;
  final bool? dateTbd;
  final bool? dateTba;
  final bool? timeTba;
  final bool? noSpecificTime;

  StartDTO({
    this.localDate,
    this.localTime,
    this.dateTime,
    this.dateTbd,
    this.dateTba,
    this.timeTba,
    this.noSpecificTime,
  });

  factory StartDTO.fromJson(Map<String, dynamic> json) => StartDTO(
    localDate: json["localDate"] == null ? null : DateTime.parse(json["localDate"]),
    localTime: json["localTime"],
    dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
    dateTbd: json["dateTBD"],
    dateTba: json["dateTBA"],
    timeTba: json["timeTBA"],
    noSpecificTime: json["noSpecificTime"],
  );

  Map<String, dynamic> toJson() => {
    "localDate": "${localDate!.year.toString().padLeft(4, '0')}-${localDate!.month.toString().padLeft(2, '0')}-${localDate!.day.toString().padLeft(2, '0')}",
    "localTime": localTime,
    "dateTime": dateTime?.toIso8601String(),
    "dateTBD": dateTbd,
    "dateTBA": dateTba,
    "timeTBA": timeTba,
    "noSpecificTime": noSpecificTime,
  };

  Start toStart() {
    return Start(
      localDate: localDate,
      localTime: localTime,
      dateTime: dateTime,
      dateTbd: dateTbd,
      dateTba: dateTba,
      timeTba: timeTba,
      noSpecificTime: noSpecificTime
    );
  }
}