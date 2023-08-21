class PublicDTO {
  final DateTime? startDateTime;
  final bool? startTbd;
  final bool? startTba;
  final DateTime? endDateTime;

  PublicDTO({
    this.startDateTime,
    this.startTbd,
    this.startTba,
    this.endDateTime,
  });

  factory PublicDTO.fromJson(Map<String, dynamic> json) => PublicDTO(
    startDateTime: json["startDateTime"] == null ? null : DateTime.parse(json["startDateTime"]),
    startTbd: json["startTBD"],
    startTba: json["startTBA"],
    endDateTime: json["endDateTime"] == null ? null : DateTime.parse(json["endDateTime"]),
  );

  Map<String, dynamic> toJson() => {
    "startDateTime": startDateTime?.toIso8601String(),
    "startTBD": startTbd,
    "startTBA": startTba,
    "endDateTime": endDateTime?.toIso8601String(),
  };
}