
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Image.asset('assets/samsung.png'), //todo change  this to appropriate logo
          Image.asset('assets/sava-river.jpg'),
          Align(
            alignment: Alignment.centerRight,
            child: Column(children: <Widget>[
              Text('changing climate', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
              Text('changing parasites  ', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
            ],),
          ),
          Text('August 25-29, 2020 | Belgrade', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),),
        ],
      ),
    );
  }

}