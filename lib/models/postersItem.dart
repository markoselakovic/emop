import 'package:firebase_database/firebase_database.dart';

class PostersItem {

  String id;
  String day;
  String date;
  String timeZone;
  String time;
  int order;

  String title;

  PostersItem(this.id,this.day, this.date, this.timeZone, this.time, this.order, this.title);

  PostersItem.fromMap(String key, Map map) {
    id = key;
    date = map["date"];
    timeZone = map["timeZone"];
    time = map["time"];
    order = map["order"];
    title = map["title"];
  }

  PostersItem.fromSnapshot(DataSnapshot snapshot) :
        id = snapshot.key,
        date = snapshot.value["date"],
        day = snapshot.value["day"],
        timeZone = snapshot.value['timeZone'],
        time = snapshot.value['time'],
        order = snapshot.value['order'],
        title = snapshot.value['title'];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'date': date,
      'day': day,
      'timeZone': timeZone,
      'time': time,
      'order': order,
      'title': title
    };
  }
}