import 'package:event_app/data/remote/model/start_dto.dart';
import 'package:event_app/data/remote/model/status_dto.dart';
import 'package:event_app/domain/model/dates.dart';

class DatesDTO {
  final StartDTO start;
  final StatusDTO? status;
  final bool? spanMultipleDays;

  DatesDTO({
    required this.start,
    this.status,
    this.spanMultipleDays,
  });

  factory DatesDTO.fromJson(Map<String, dynamic> json) => DatesDTO(
    start: StartDTO.fromJson(json["start"]),
    status: json["status"] == null ? null : StatusDTO.fromJson(json["status"]),
    spanMultipleDays: json["spanMultipleDays"],
  );

  Map<String, dynamic> toJson() => {
    "start": start.toJson(),
    "status": status?.toJson(),
    "spanMultipleDays": spanMultipleDays,
  };

  Dates toDates() {
    return Dates(
      start: start.toStart(),
      status: status?.toStatus(),
      spanMultipleDays: spanMultipleDays
    );
  }
}