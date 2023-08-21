class PriceRangeDTO {
  String? type;
  String? currency;
  double? min;
  double? max;

  PriceRangeDTO({
    this.type,
    this.currency,
    this.min,
    this.max,
  });

  factory PriceRangeDTO.fromJson(Map<String, dynamic> json) => PriceRangeDTO(
    type: json["type"],
    currency: json["currency"],
    min: json["min"],
    max: json["max"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "currency": currency,
    "min": min,
    "max": max,
  };
}