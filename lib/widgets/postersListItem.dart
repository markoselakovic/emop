import 'package:emop/models/postersItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostersListItem extends StatelessWidget {

  final PostersItem item;

  PostersListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Row(
    children: <Widget>[
      Expanded(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            children: <Widget>[
              Text(item.day, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
              Text(item.date, style: TextStyle(color: Colors.lime[600], fontSize: 13)),
              Text(item.timeZone, style: TextStyle(color: Colors.blue, fontSize: 13, fontWeight: FontWeight.bold)),
              Text(item.time)
            ],
          ),
        ),
      ),
      Expanded(child: Text(item.title, style: TextStyle(fontSize: 18)))
    ])
    ;
  }

}