class AddressDTO {
  final String? line1;

  AddressDTO({
    this.line1,
  });

  factory AddressDTO.fromJson(Map<String, dynamic> json) => AddressDTO(
    line1: json["line1"],
  );

  Map<String, dynamic> toJson() => {
    "line1": line1,
  };
}