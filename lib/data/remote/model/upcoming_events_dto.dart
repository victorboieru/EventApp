class UpcomingEventsDTO {
  final int? tmr;
  final int? ticketmaster;
  final int? total;
  final int? filtered;

  UpcomingEventsDTO({
    this.tmr,
    this.ticketmaster,
    this.total,
    this.filtered,
  });

  factory UpcomingEventsDTO.fromJson(Map<String, dynamic> json) => UpcomingEventsDTO(
    tmr: json["tmr"],
    ticketmaster: json["ticketmaster"],
    total: json["_total"],
    filtered: json["_filtered"],
  );

  Map<String, dynamic> toJson() => {
    "tmr": tmr,
    "ticketmaster": ticketmaster,
    "_total": total,
    "_filtered": filtered,
  };
}