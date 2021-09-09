import 'package:emop/data/repository.dart';
import 'package:emop/screens/searchablePage.dart';
import 'package:emop/widgets/agendaListItem.dart';
import 'package:flutter/material.dart';

class AgendaPage extends StatefulWidget {

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends SearchablePageState {

  @override
  void initState() {
    items = Repository().getAgenda();
    itemsStreamSubscription = Repository().getAgendaStream().listen((event) {
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