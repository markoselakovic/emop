import 'package:emop/data/favorites.dart';
import 'package:emop/models/agendaItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgendaListItem extends StatefulWidget {
  final AgendaItem item;
  final Favorites favorites;
  AgendaListItem(this.item, this.favorites, {Key key}) :super(key: key);

  @override
  _AgendaListItemState createState() => _AgendaListItemState();
}

class _AgendaListItemState extends State<AgendaListItem> {

  // final AgendaItem _item;
  // final Favorites _favorites;
  // _AgendaListItemState(this._item, this._favorites);

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
                  Text(widget.item.day,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  Text(widget.item.date,
                      style: TextStyle(color: Colors.lime[600], fontSize: 13)),
                  Text(widget.item.time),
                  Text(widget.item.r),
                ],
              ),
            ),
          ),
          getAgendaText(widget.item),
          getFavoriteIcon(),
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
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(item.title, style: TextStyle(fontSize: 15)),
              Text(item.organizer,
                  style: TextStyle(fontSize: 13, color: Colors.grey))
            ]),
          ));
    } else {
      return Expanded(child: Text(item.title, style: TextStyle(fontSize: 15)));
    }
  }

  Widget getFavoriteIcon() {
    bool isFavorite = widget.favorites.isFavorite(widget.item.id);
    return IconButton(
        iconSize: 30.0,
        icon: Padding(
            padding: EdgeInsets.only(left: 4, right: 4, top: 0),
            child: isFavorite
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border_rounded)),
        onPressed: () {
          setState(() {
            if (isFavorite) {
              widget.favorites.removeFromFavorite(widget.item.id);
            } else {
              widget.favorites.addToFavorite(widget.item.id);
            }
          });
        });
  }
}
