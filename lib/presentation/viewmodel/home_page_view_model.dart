import 'dart:developer';
import 'package:event_app/common/api_response.dart';
import 'package:event_app/di/injectable.dart';
import 'package:event_app/domain/repository/irepository.dart';
import 'package:event_app/domain/model/genre.dart';
import 'package:event_app/domain/model/event_response.dart';
import 'package:event_app/domain/model/event.dart';
import 'package:flutter/cupertino.dart';

class HomePageViewModel with ChangeNotifier {

  HomePageViewModel() {
    getEvents(1);
  }

  IRepository repository = getIt<IRepository>();
  ApiResponse _apiResponse = ApiResponse.loading("Fetching data");
  List<Event> events = List.empty();

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> getEvents(int page) async {
    try {
      EventsResponse? eventsResponse = await repository.getEventList(page);
      if (page == 1) {
        events = eventsResponse?.embedded?.events ?? List.empty();
      } else {
        events += eventsResponse?.embedded?.events ?? List.empty();
      }
      _apiResponse = ApiResponse.completed(events);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> getEventsByGenre(int page, String genreId) async {
    try {
      // IRepository repository = Repository();
      EventsResponse? eventsResponse = await repository.getEventsByGenre(page, genreId);
      if (page == 1) {
        events = eventsResponse?.embedded?.events ?? List.empty();
      } else {
        events += eventsResponse?.embedded?.events ?? List.empty();
      }
      _apiResponse = ApiResponse.completed(events);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      log(e.toString());
    }
    notifyListeners();
  }

  void searchEventsByName(String name) {
    List<Event> result = events.where((element) => element.name!.toLowerCase().contains(name)).toList();
    _apiResponse = ApiResponse.completed(result);
    notifyListeners();
  }
  
  Set<Genre> createGenreList() {
    Set<Genre> genreList = Set.of({Genre(id: "", name: "All genres")});
    events.forEach((element) {
      element.classifications?.forEach((element) {
        genreList.add(Genre(id: element.genre!.id, name: element.genre!.name));
      });
    });
    return genreList;
  }
}