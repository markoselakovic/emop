class PostersItem {

  String id;
  String day;
  String date;
  String timeZone;
  String time;

  String title;

  PostersItem(this.id,this.day, this.date, this.timeZone, this.time, this.title);

  PostersItem.fromMap(String key, Map map) {
    id = key;
    date = map["date"];
    timeZone = map["timeZone"];
    time = map["time"];
    title = map["title"];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'date': date,
      'timeZone': timeZone,
      'time': time,
      'title': title
    };
  }
}