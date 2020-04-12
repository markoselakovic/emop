import 'dart:async';

import 'package:emop/models/postersItem.dart';
import 'package:firebase_database/firebase_database.dart';

class Repository {
  static final Repository _instance = Repository._internal();
  factory Repository() => _instance;

  DatabaseReference _agendaReference;
  DatabaseReference _postersReference;
  StreamController<List<PostersItem>> _agendaStreamController;
  StreamController<List<PostersItem>> _postersStreamController;
  List<PostersItem> _posters;
  List<PostersItem> _groups;

  Repository._internal() {
    FirebaseDatabase.instance.setPersistenceEnabled(true);
    _agendaReference = FirebaseDatabase.instance.reference().child('agenda');
//    _agendaReference.onChildAdded.listen(_onRescuerAdded);
//    _agendaReference.onChildRemoved.listen(_onRescuerRemoved);
    _postersReference = FirebaseDatabase.instance.reference().child("posters");
    _postersReference.onChildAdded.listen(_onPosterItemAdded);
    _postersReference.onChildRemoved.listen(_onPosterItemRemoved);
    _postersReference.onChildChanged.listen(_onPosterItemChanged);
    _agendaStreamController = new StreamController.broadcast();
    _postersStreamController = new StreamController.broadcast();
    _posters = new List();
    _groups = new List();
  }

  Stream<List<PostersItem>> getPostersStream() {
    return _postersStreamController.stream;
  }

  _onPosterItemAdded(Event event) {
    _posters.add(PostersItem.fromSnapshot(event.snapshot));
    _postersStreamController.add(_posters);
  }

  _onPosterItemRemoved(Event event) {
    _posters.removeWhere((poster) => poster.id == event.snapshot.key);
    _postersStreamController.add(_posters);
  }
  _onPosterItemChanged(Event event) {
    _posters.removeWhere((poster) => poster.id == event.snapshot.key);
    _posters.add(PostersItem.fromSnapshot(event.snapshot));
    _postersStreamController.add(_posters);
  }
}