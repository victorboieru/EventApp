class AllInclusivePricingDTO {
  bool? enabled;

  AllInclusivePricingDTO({
    this.enabled,
  });

  factory AllInclusivePricingDTO.fromJson(Map<String, dynamic> json) => AllInclusivePricingDTO(
    enabled: json["enabled"],
  );

  Map<String, dynamic> toJson() => {
    "enabled": enabled,
  };
}