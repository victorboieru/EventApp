class AccessibilityDTO {
  int? ticketLimit;

  AccessibilityDTO({
    this.ticketLimit,
  });

  factory AccessibilityDTO.fromJson(Map<String, dynamic> json) => AccessibilityDTO(
    ticketLimit: json["ticketLimit"],
  );

  Map<String, dynamic> toJson() => {
    "ticketLimit": ticketLimit,
  };
}