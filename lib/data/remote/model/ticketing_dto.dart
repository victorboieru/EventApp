import 'package:event_app/data/remote/model/all_inclusive_pricing_dto.dart';

class TicketingDTO {
  AllInclusivePricingDTO? safeTix;
  AllInclusivePricingDTO? allInclusivePricing;

  TicketingDTO({
    this.safeTix,
    this.allInclusivePricing,
  });

  factory TicketingDTO.fromJson(Map<String, dynamic> json) => TicketingDTO(
    safeTix: json["safeTix"] == null ? null : AllInclusivePricingDTO.fromJson(json["safeTix"]),
    allInclusivePricing: json["allInclusivePricing"] == null ? null : AllInclusivePricingDTO.fromJson(json["allInclusivePricing"]),
  );

  Map<String, dynamic> toJson() => {
    "safeTix": safeTix?.toJson(),
    "allInclusivePricing": allInclusivePricing?.toJson(),
  };
}