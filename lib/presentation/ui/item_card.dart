import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:event_app/domain/model/event.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({super.key, required this.event});

  final Event event;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    DateTime? startDate = widget.event.dates.start.localDate;
    return Card(
        color: Colors.white,
        elevation: 5,
        margin: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(15.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.network(
                      widget.event.images?[0].url ?? "",
                      fit: BoxFit.cover,
                      height: 100.0,
                      width: 100.0,
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 35.0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.event.name ?? "",
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                const Icon(Icons.calendar_month_outlined),
                                const SizedBox(width: 5.0),
                                Text(DateFormat('dd MMM yyyy', 'en_US').format(startDate!))
                              ],
                            )
                          ],
                        ))),
              ],
            ),
            const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(Icons.favorite_border_outlined),
                ))
          ],
        ));
  }
}
