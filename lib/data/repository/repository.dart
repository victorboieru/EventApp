import 'package:event_app/data/remote/api_service.dart';
import 'package:event_app/data/remote/model/events_response_dto.dart';
import 'package:event_app/data/remote/model/event_detail_dto.dart';
import 'package:event_app/di/injectable.dart';
import 'package:event_app/domain/model/event_details.dart';
import 'package:event_app/domain/repository/irepository.dart';
import 'package:event_app/domain/model/event_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : IRepository)
class Repository implements IRepository {

  final ApiService _apiService = getIt<ApiService>();

  @override
  Future<EventsResponse?> getEventList(int page) async {
    EventsResponseDTO? response = await _apiService.getEvents(page);
    return response?.toEventsResponse();
  }

  @override
  Future<EventsResponse?> getEventsByGenre(int page, String genreId) async {
    EventsResponseDTO? response = await _apiService.getEventsByGenre(page, genreId);
    return response?.toEventsResponse();
  }

  @override
  Future<EventDetails?> getEventDetails(String eventId) async {
    EventDetailDTO? response = await _apiService.getEventDetails(eventId);
    return response?.toEventDetails();
  }
}