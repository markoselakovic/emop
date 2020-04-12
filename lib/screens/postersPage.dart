import 'package:emop/models/postersItem.dart';
import 'package:emop/screens/searchablePage.dart';
import 'package:emop/widgets/postersListItem.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PostersPage extends StatefulWidget {

  @override
  _PostersPageState createState() => _PostersPageState();
}

class _PostersPageState extends SearchablePageState<PostersPage> {
  PostersItem i1 = PostersItem("1", "Mon", "Aug 25, 2020", "Baltic" , "10:00-14:30", 1, "Euro FBP \nPre-symposium");
  PostersItem i2 = PostersItem("2", "Tue", "Aug 25, 2020", "Pacific/Atlantic", "14:30-19:00",  2, "Registration");
  PostersItem i3 = PostersItem("2", "Wed", "Aug 25, 2020", "Pacific/Atlantic", "14:30-19:00", 3, "Registration");
  PostersItem i4 = PostersItem("2", "Thu", "Aug 25, 2020", "Atlantic", "14:30-19:00", 4, "Registration");

  @override
  void initState() {
    items = new List<PostersItem>();
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
    filteredItems = new List<PostersItem>();
    super.initState();
  }

  @override
  Widget getListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: filteredItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child: PostersListItem(
                filteredItems[index],
              ));
        });
  }

//@override
//  Widget getListView() {
//    // TODO: implement getListView
//    return RaisedButton(
//      onPressed: () {
//        FirebaseDatabase.instance.reference().child("posters").push().set(i1.toJson());
//      },
//      color: Colors.lightGreen[600],
//      child: Container(
//        padding: EdgeInsets.all(5.0),
//        child: Text(
//          'update',
//          textAlign: TextAlign.center,
//          style: TextStyle(fontSize: 15, color: Colors.white),
//        ),
//      ),
//    );
//  }
}
