import 'package:event_app/domain/model/event_details.dart';
import 'package:event_app/presentation/viewmodel/event_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:event_app/common/api_response.dart';
import 'package:event_app/common/status.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key, required this.eventId});

  final String eventId;

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  late EventDetailsViewModel _viewModel;
  EventDetails? _event;

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of(context);
    ApiResponse apiResponse = _viewModel.response;
    if (_event == null) {
      _viewModel.getEventDetails(widget.eventId);
    }
    if (apiResponse.status == Status.COMPLETED) {
      setState(() {
        _event = apiResponse.data;
      });
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Event details"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  _event?.name ?? "",
                ),
                const Text(
                  "Type",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  _event?.type ?? "",
                ),
                const Text(
                  "Url",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  _event?.url ?? "",
                ),
                const Text(
                  "Info",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  _event?.info ?? "",
                ),
                const Text(
                  "Please note",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  _event?.pleaseNote ?? "",
                )
              ],
            ),
          )
        )
    );
  }
}

