import 'package:emop/screens/AgendaPage.dart';
import 'package:emop/screens/postersPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMOP',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'EMOP 2020 | Belgrade'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    AgendaPage(),
    PostersPage(),
    Text(
      'Index 4: Social',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('EMOP 2020 | Belgrade'),
          backgroundColor: Colors.lightGreen[600],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted),
              title: Text('Agenda'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              title: Text('Posters'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.conversation_bubble),
              title: Text('Social'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.lime[300],
          unselectedItemColor: Colors.black54,
          onTap: _onItemTapped,
        ),
      );
    }
}
