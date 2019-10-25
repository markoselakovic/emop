import 'package:emop/models/postersItem.dart';
import 'package:emop/widgets/postersListItem.dart';
import 'package:flutter/material.dart';

class PostersPage extends StatefulWidget {

  @override
  _PostersPageState createState() => _PostersPageState();

}

class _PostersPageState extends State<PostersPage> {

  List<PostersItem> items;
  PostersItem i1 = PostersItem("1","Tue", "Aug 25, 2020", "Baltic", "10:00-14:30", "Euro FBP \nPre-symposium");
  PostersItem i2 = PostersItem("2", "Tue", "Aug 25, 2020", "Pacific/Atlantic", "14:30-19:00", "Registration");


  @override
  Widget build(BuildContext context) {
    items = new List();
    items.add(i1);
    items.add(i2);
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(child: PostersListItem(items[index],
            )
          );
        });
  }

}