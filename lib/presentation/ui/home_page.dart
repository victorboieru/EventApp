import 'package:event_app/presentation/ui/event_details_page.dart';
import 'package:event_app/presentation/ui/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:event_app/common/api_response.dart';
import 'package:event_app/common/status.dart';
import 'package:provider/provider.dart';
import 'package:event_app/presentation/viewmodel/home_page_view_model.dart';
import 'package:event_app/domain/model/genre.dart';
import 'package:event_app/domain/model/event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageViewModel viewModel;
  List<Event> _events = List.empty();

  final _controller = ScrollController();
  final FocusNode _focus = FocusNode();
  final fieldTextController = TextEditingController();

  int _pageCounter = 1;
  Set<Genre> _genreList = Set();
  String _currentSelectedValue = "";
  Color containerColor = Colors.black.withOpacity(0.5);
  bool clearTextButtonVisibility = false;

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();

    _focus.addListener(_onFocusChange);

    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (!isTop) {
          _pageCounter++;
          if (_currentSelectedValue.isEmpty) {
            viewModel.getEvents(_pageCounter);
          } else {
            viewModel.getEventsByGenre(_pageCounter, _currentSelectedValue);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of(context);
    ApiResponse apiResponse = viewModel.response;
    if (apiResponse.status == Status.COMPLETED) {
      setState(() {
        _events = apiResponse.data;
        if (_currentSelectedValue.isEmpty) {
          _genreList = viewModel.createGenreList();
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Events",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: containerColor, width: 1.0),
                    borderRadius: BorderRadius.circular(50)),
                margin: const EdgeInsets.only(
                    left: 15.0, right: 15.0, bottom: 30.0),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.search, size: 30),
                      ),
                      Expanded(
                          child: TextField(
                        focusNode: _focus,
                        controller: fieldTextController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 8.0)),
                        onChanged: (text) {
                          _changeClearTextButtonVisibility(text.isNotEmpty);
                          viewModel.searchEventsByName(text);
                        },
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                      )),
                      Visibility(
                          visible: clearTextButtonVisibility,
                          child: GestureDetector(
                              onTap: () {
                                fieldTextController.clear();
                                _changeClearTextButtonVisibility(false);
                                viewModel.searchEventsByName("");
                              },
                              child: const Icon(Icons.close, size: 30))),
                      VerticalDivider(
                        width: 20,
                        thickness: 1,
                        indent: 10.0,
                        endIndent: 10.0,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Expanded(
                          child: DropdownButtonFormField(
                        items: _genreList.map((Genre value) {
                          return DropdownMenuItem<Genre>(
                            value: value,
                            child: Text(
                              value.name,
                              style: const TextStyle(fontSize: 15.0),
                            ),
                          );
                        }).toList(),
                        onChanged: (Genre? newValue) {
                          _currentSelectedValue = newValue!.id;
                          _pageCounter = 1;
                          if (_currentSelectedValue.isEmpty) {
                            viewModel.getEvents(_pageCounter);
                          } else {
                            viewModel.getEventsByGenre(
                                _pageCounter, _currentSelectedValue);
                          }
                        },
                        iconSize: 30,
                        iconDisabledColor: Colors.orangeAccent,
                        iconEnabledColor: Colors.orangeAccent,
                        // value: _currentSelectedValue,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ))
                    ],
                  ),
                )),
            Expanded(
                child: _events.isNotEmpty
                    ? ListView.builder(
                        controller: _controller,
                        itemCount: _events.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => GestureDetector(
                              child: ItemCard(event: _events[index]),
                              onTap: () {
                                // viewModel.getEventDetails(_events[index].id!);
                                navigatetoEventDetailsPage(_events[index].id!);
                              },
                            ))
                    : Center(
                        child: apiResponse.status == Status.LOADING
                            ? const CircularProgressIndicator()
                            : const Text("No results"),
                      ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {
      if (_focus.hasFocus) {
        containerColor = Colors.orangeAccent;
      } else {
        containerColor = Colors.black.withOpacity(0.5);
      }
    });
  }

  void _changeClearTextButtonVisibility(bool visible) {
    setState(() {
      clearTextButtonVisibility = visible;
    });
  }

  void navigatetoEventDetailsPage(String eventId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EventDetailsPage(eventId: eventId)));
  }
}
