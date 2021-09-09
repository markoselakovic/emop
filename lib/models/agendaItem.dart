import 'package:firebase_database/firebase_database.dart';

class AgendaItem {

  String id;
  String day;
  String date;
  String time;
  String order;

  String title;
  String organizer;

  AgendaItem(this.id,this.day, this.date, this.time, this.order, this.title, this.organizer);

  AgendaItem.fromMap(String key, Map map) {
    id = key;
    date = map["date"];
    time = map["time"];
    order = map["order"];
    title = map["title"];
    organizer = map["organizer"];
  }

  AgendaItem.fromSnapshot(DataSnapshot snapshot) :
        id = snapshot.key,
        date = snapshot.value["date"],
        day = snapshot.value["day"],
        time = snapshot.value['time'],
        order = snapshot.value['order'],
        title = snapshot.value['title'],
        organizer = snapshot.value["organizer"];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'date': date,
      'day': day,
      'time': time,
      'order': order,
      'title': title,
      'organizer' : organizer
    };
  }
}