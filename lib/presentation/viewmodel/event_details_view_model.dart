import 'package:event_app/common/api_response.dart';
import 'package:event_app/di/injectable.dart';
import 'package:event_app/domain/repository/irepository.dart';
import 'package:event_app/domain/model/event_details.dart';
import 'dart:developer';
import 'package:flutter/cupertino.dart';

class EventDetailsViewModel with ChangeNotifier{

  IRepository repository = getIt<IRepository>();
  ApiResponse _apiResponse = ApiResponse.loading("Fetching data");

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> getEventDetails(String eventId) async {
    try {
      EventDetails? eventDetailsResponse = await repository.getEventDetails(eventId);
      _apiResponse = ApiResponse.completed(eventDetailsResponse);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      log(e.toString());
    }
    notifyListeners();
  }
}