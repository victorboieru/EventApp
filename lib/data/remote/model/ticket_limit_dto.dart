class TicketLimitDTO {
  String? info;

  TicketLimitDTO({
    this.info,
  });

  factory TicketLimitDTO.fromJson(Map<String, dynamic> json) => TicketLimitDTO(
    info: json["info"],
  );

  Map<String, dynamic> toJson() => {
    "info": info,
  };
}
