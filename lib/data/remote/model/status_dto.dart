import 'package:event_app/domain/model/status.dart';

class StatusDTO {
  final String? code;

  StatusDTO({
    this.code,
  });

  factory StatusDTO.fromJson(Map<String, dynamic> json) => StatusDTO(
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
  };

  Status toStatus() {
    return Status(
      code: code
    );
  }
}