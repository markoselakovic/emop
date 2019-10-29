import 'package:emop/models/postersItem.dart';
import 'package:emop/widgets/postersListItem.dart';
import 'package:flutter/material.dart';

const String ALL_DAYS = "All days";
class PostersPage extends StatefulWidget {
  @override
  _PostersPageState createState() => _PostersPageState();
}

class _PostersPageState extends State<PostersPage> {
  TextEditingController editingController = TextEditingController();
  PostersItem i1 = PostersItem("1", "Mon", "Aug 25, 2020", "Baltic" , "10:00-14:30", 1, "Euro FBP \nPre-symposium");
  PostersItem i2 = PostersItem("2", "Tue", "Aug 25, 2020", "Pacific/Atlantic", "14:30-19:00",  2, "Registration");
  PostersItem i3 = PostersItem("2", "Wed", "Aug 25, 2020", "Pacific/Atlantic", "14:30-19:00", 3, "Registration");
  PostersItem i4 = PostersItem("2", "Thu", "Aug 25, 2020", "Atlantic", "14:30-19:00", 4, "Registration");
  String _dropdownValue = ALL_DAYS;
  String _searchQuery = "";
  List<String> days = <String>[ALL_DAYS, 'Mon', 'Tue', 'Wed', 'Thu'];
  List<PostersItem> items;
  List<PostersItem> _filteredItems;


  @override
  void initState() {
    super.initState();
    items = new List();
    items.add(i1);
    items.add(i2);
    items.add(i3);
    items.add(i4);
    items.add(i4);
    items.add(i4);
    items.add(i4);
    items.add(i4);
    items.add(i4);
    items.add(i4);
    items.add(i4);
    items.add(i4);
    items.add(i4);
    _filteredItems = new List();
    _updateList();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                child: Align(
              alignment: Alignment.centerLeft,
              child: DropdownButton<String>(
                value: _dropdownValue,
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
                    _dropdownValue = newValue;
                    _updateList();
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
            Expanded(child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                  _updateList();
                });
              },
              controller: editingController,
              decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),)
            ),),
          ],
        ),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _filteredItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                    child: PostersListItem(
                  _filteredItems[index],
                ));
              }),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    editingController.dispose();
  }

  void _updateList() {
    _filteredItems = items.where((item) => (_dropdownValue == ALL_DAYS || item.day == _dropdownValue) &&
        (_searchQuery.isEmpty || item.title.toLowerCase().contains(_searchQuery.toLowerCase()))).toList();
    _filteredItems.sort((a,b) => a.order.compareTo(b.order));
  }
}
