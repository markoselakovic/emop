import 'dart:async';

import 'package:emop/models/agendaItem.dart';
import 'package:firebase_database/firebase_database.dart';

class Repository {
  static final Repository _instance = Repository._internal();
  factory Repository() => _instance;

  DatabaseReference _agendaReference;
  DatabaseReference _postersReference;
  StreamController<List<AgendaItem>> _agendaStreamController;
  StreamController<List<AgendaItem>> _postersStreamController;
  List<AgendaItem> _posters;
  List<AgendaItem> _agenda;

  Repository._internal() {
    FirebaseDatabase.instance.setPersistenceEnabled(true);
    _agendaReference = FirebaseDatabase.instance.reference().child('agenda');
    _postersReference = FirebaseDatabase.instance.reference().child('postersUpload');
    _postersReference.onChildAdded.listen(_onPosterItemAdded);
    _postersReference.onChildRemoved.listen(_onPosterItemRemoved);
    _postersReference.onChildChanged.listen(_onPosterItemChanged);
    _agendaReference.onChildAdded.listen(_onAgendaItemAdded);
    _agendaReference.onChildRemoved.listen(_onAgendaItemRemoved);
    _agendaReference.onChildChanged.listen(_onAgendaItemChanged);
    _agendaStreamController = new StreamController.broadcast();
    _postersStreamController = new StreamController.broadcast();
    _posters = [];
    _agenda = [];
  }

  Stream<List<AgendaItem>> getPostersStream() {
    return _postersStreamController.stream;
  }

  List<AgendaItem> getPosters() {
    return _posters;
  }

  _onPosterItemAdded(Event event) {
    _posters.add(AgendaItem.fromSnapshot(event.snapshot));
    _postersStreamController.add(_posters);
  }

  _onPosterItemRemoved(Event event) {
    _posters.removeWhere((poster) => poster.id == event.snapshot.key);
    _postersStreamController.add(_posters);
  }
  _onPosterItemChanged(Event event) {
    _posters.removeWhere((poster) => poster.id == event.snapshot.key);
    _posters.add(AgendaItem.fromSnapshot(event.snapshot));
    _postersStreamController.add(_posters);
  }

  Stream<List<AgendaItem>> getAgendaStream() {
    return _agendaStreamController.stream;
  }

  List<AgendaItem> getAgenda() {
    return _agenda;
  }

  _onAgendaItemAdded(Event event) {
    _agenda.add(AgendaItem.fromSnapshot(event.snapshot));
    _agendaStreamController.add(_posters);
  }

  _onAgendaItemRemoved(Event event) {
    _agenda.removeWhere((agenda) => agenda.id == event.snapshot.key);
    _agendaStreamController.add(_posters);
  }
  _onAgendaItemChanged(Event event) {
    _agenda.removeWhere((agenda) => agenda.id == event.snapshot.key);
    _agenda.add(AgendaItem.fromSnapshot(event.snapshot));
    _agendaStreamController.add(_posters);
  }
}