class AgeRestrictionsDTO {
  bool? legalAgeEnforced;

  AgeRestrictionsDTO({
    this.legalAgeEnforced,
  });

  factory AgeRestrictionsDTO.fromJson(Map<String, dynamic> json) => AgeRestrictionsDTO(
    legalAgeEnforced: json["legalAgeEnforced"],
  );

  Map<String, dynamic> toJson() => {
    "legalAgeEnforced": legalAgeEnforced,
  };
}