
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Image.asset('assets/logo.jpeg'),
          Image.asset('assets/sava-river.jpg'),
          Text('August 25-29, 2020 | Belgrade', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),),
        ],
      ),
    );
  }

}