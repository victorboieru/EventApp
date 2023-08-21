import 'dart:developer';

import 'package:event_app/data/remote/model/event_detail_dto.dart';
import 'package:event_app/data/remote/model/events_response_dto.dart';
import 'package:http/http.dart' as http;
import 'package:event_app/common/constants.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ApiService {
  Future<EventsResponseDTO?> getEvents(int page) async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.eventsEndpoint + "?apikey=" + Constants.apikey + "&page=" + page.toString());
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return eventsResponseFromJson(response.body);
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<EventsResponseDTO?> getEventsByGenre(int page, String genreId) async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.eventsEndpoint + "?apikey=" + Constants.apikey + "&page=" + page.toString() + "&genreId=" + genreId);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return eventsResponseFromJson(response.body);
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<EventDetailDTO?> getEventDetails(String eventId) async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.eventsEndpoint + "/" + eventId + "?apikey=" + Constants.apikey);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return eventDetailFromJson(response.body);
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
