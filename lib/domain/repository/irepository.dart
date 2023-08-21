import 'package:event_app/domain/model/event_details.dart';
import 'package:event_app/domain/model/event_response.dart';

abstract class IRepository {

  Future<EventsResponse?> getEventList(int page);

  Future<EventsResponse?> getEventsByGenre(int page, String genreId);

  Future<EventDetails?> getEventDetails(String eventId);
}