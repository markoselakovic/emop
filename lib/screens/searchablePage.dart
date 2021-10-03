import 'dart:async';

import 'package:emop/data/favorites.dart';
import 'package:flutter/material.dart';

const String ALL_DAYS = "All days";

abstract class SearchablePageState<T extends StatefulWidget> extends State<T> {
  TextEditingController editingController = TextEditingController();

  String dropdownValue = ALL_DAYS;
  String searchQuery = "";
  List<String> days = <String>[ALL_DAYS, 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

  List items;
  List filteredItems;
  Favorites favorites;
  bool _isFavoritesActive = false;
  StreamSubscription itemsStreamSubscription;

  Widget getListView();

  @override
  void initState() {
    super.initState();
    filteredItems = [];
    updateList();
  }

  @override
  void dispose() {
    itemsStreamSubscription.cancel();
    editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Align(
                alignment: Alignment.centerLeft,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.lime[600]),
                  underline: Container(
                    height: 2,
                    color: Colors.lime[600],
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      updateList();
                    });
                  },
                  items: days.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              )),
              Expanded(
                child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                        updateList();
                      });
                    },
                    controller: editingController,
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                    )),
              ),
            ],
          ),
        ),
        Expanded(
          child: getListView(),
        ),
      ],
    );
  }

  void updateList() {
    filteredItems = items
        .where((item) =>
            (dropdownValue == ALL_DAYS || item.day == dropdownValue) &&
            (searchQuery.isEmpty ||
                item.title.toLowerCase().contains(searchQuery.toLowerCase())))
        .toList();
    if (_isFavoritesActive) {
      filteredItems = filteredItems.where((element) {
        return favorites.isFavorite(element.id);
      }).toList();
    }
    filteredItems.sort((a, b) => a.order.compareTo(b.order));
  }

  void updateFavorites(bool isActive) {
    setState(() {
      _isFavoritesActive = isActive;
      updateList();
    });

  }
}
