import 'package:emop/screens/searchablePage.dart';
import 'package:flutter/material.dart';

class AgendaPage extends StatefulWidget {

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends SearchablePageState {

  @override
  Widget getListView() {
   return Text("TODO: Agenda");
  }

  @override
  void initState() {
   items = new List();
   filteredItems = new List();
   super.initState();
  }

}