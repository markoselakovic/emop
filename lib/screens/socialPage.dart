import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SocialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          height: 60,
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Spacer(),
              Image.asset('assets/FB.png'),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Image.asset('assets/INST.png'),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Container(
                height: 60, padding: EdgeInsets.only(bottom: 10, top: 20), child: Image.asset('assets/SOCIAL.png')),
            Spacer()
          ],
        ),
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: Text("Wednesday / August 26th"),
              ),
              Container(
                color: Colors.green,
//                child: Text("White Palace Gala Dinner", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: "SinkinSans"),),
              )
            ],
          ),
        )
      ],
    ));
  }
}
