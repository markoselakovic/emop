import 'package:firebase_database/firebase_database.dart';

class AgendaItem {

  int id;
  String day;
  String date;
  String time;
  String order;
  String room;

  String title;
  String organizer;

  AgendaItem(this.id,this.day, this.date, this.time, this.order, this.room, this.title, this.organizer);

  AgendaItem.fromMap(String key, Map map) {
    id = int.tryParse(key) ?? 0;
    date = map["date"];
    time = map["time"];
    order = map["order"];
    room = map["room"];
    title = map["title"];
    organizer = map["organizer"];
  }

  AgendaItem.fromSnapshot(DataSnapshot snapshot) :
        id = int.tryParse(snapshot.key) ?? 0,
        date = snapshot.value["date"],
        day = snapshot.value["day"],
        time = snapshot.value['time'],
        order = snapshot.value['order'],
        room = snapshot.value['room'],
        title = snapshot.value['title'],
        organizer = snapshot.value["organizer"];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'date': date,
      'day': day,
      'time': time,
      'room': room,
      'order': order,
      'title': title,
      'organizer' : organizer
    };
  }
}