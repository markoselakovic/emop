import 'package:emop/models/agendaItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgendaListItem extends StatelessWidget {
  final AgendaItem item;

  AgendaListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(minWidth: 100),
            padding: EdgeInsets.symmetric(vertical: 1),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: <Widget>[
                  Text(item.day,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  Text(item.date,
                      style: TextStyle(color: Colors.lime[600], fontSize: 13)),
                  // Text(item.timeZone, style: TextStyle(color: Colors.blue, fontSize: 13, fontWeight: FontWeight.bold)),
                  Text(item.time)
                ],
              ),
            ),
          ),
          getAgendaText(item),
        ],
      ),
      Divider(
        thickness: 1,
        color: Color(0xFFD9D9D9),
      ),
    ]);
  }

  Widget getAgendaText(AgendaItem item) {
    if (item.organizer != null) {
      return Expanded(
          child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(item.title, style: TextStyle(fontSize: 15)),
          Text(item.organizer,
              style: TextStyle(
                fontSize: 13, color: Colors.grey
              ))
        ]),
      ));
    } else {
      return Expanded(child: Text(item.title, style: TextStyle(fontSize: 15)));
    }
  }
}
