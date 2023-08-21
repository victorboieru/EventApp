import 'package:event_app/domain/model/start.dart';
import 'package:event_app/domain/model/status.dart';

class Dates {
  final Start start;
  final Status? status;
  final bool? spanMultipleDays;

  Dates({
    required this.start,
    this.status,
    this.spanMultipleDays,
  });
}