import 'package:event_app/domain/model/image.dart';
import 'package:event_app/domain/model/dates.dart';
import 'package:event_app/domain/model/event_classification.dart';

class Event {
  final String? name;
  final String? id;
  final List<Image>? images;
  final Dates dates;
  final List<EventClassification>? classifications;

  Event({
    this.name,
    this.id,
    this.images,
    required this.dates,
    this.classifications,
  });
}