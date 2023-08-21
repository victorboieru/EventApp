import 'package:event_app/domain/model/genre.dart';

class EventClassification {
  final bool? primary;
  final Genre? segment;
  final Genre? genre;
  final Genre? subGenre;
  final bool? family;

  EventClassification({
    this.primary,
    this.segment,
    this.genre,
    this.subGenre,
    this.family,
  });
}