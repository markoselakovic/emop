import 'package:emop/data/repository.dart';
import 'package:emop/screens/searchablePage.dart';
import 'package:emop/widgets/agendaListItem.dart';
import 'package:flutter/material.dart';

class PostersPage extends StatefulWidget {

  @override
  _PostersPageState createState() => _PostersPageState();
}

class _PostersPageState extends SearchablePageState<PostersPage> {


  @override
  void initState() {
    items = Repository().getPosters();
    Repository().getPostersStream();
    itemsStreamSubscription = Repository().getPostersStream().listen((event) {
      setState(() {
        items = event;
        updateList();
      });
    });
    super.initState();
  }

  @override
  Widget getListView() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: filteredItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child: AgendaListItem(
                filteredItems[index],
              ));
        });
  }
}
