import 'package:emop/data/repository.dart';
import 'package:emop/screens/AgendaPage.dart';
import 'package:emop/screens/VenuePage.dart';
import 'package:emop/screens/postersPage.dart';
import 'package:emop/screens/socialPage.dart';
import 'package:emop/util/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/homePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EmopSharedPreferences(); //init
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
  Repository(); //todo remove this
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EMOP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String HOME = "Home";
  static const String AGENDA = "Agenda";
  static const String POSTERS = "Posters";
  static const String SOCIAL = "Social";
  static const String VENUE_INFORMATION = "Venue information";

  _MyHomePageState() {
    _agendaPage = AgendaPage();
    _postersPage = PostersPage();
    _widgetOptions = <Widget>[
      HomePage(),
      _agendaPage,
      // _postersPage,
      SocialPage()
    ];
  }

  int _selectedIndex = 0;
  bool _favoritesSelected = false;
  List<Widget> _widgetOptions;
  AgendaPage _agendaPage;
  PostersPage _postersPage;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child:
        ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: <Widget>[
              DrawerHeader(
                child: Image.asset('assets/EMOPLogo.png'),
                decoration: BoxDecoration(
                  color: Colors.lightGreen[600],
                ),
              ),
              ListTile(
                title: Text(VENUE_INFORMATION),
                leading: Icon(Icons.info),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VenueInformation()),
                  );
                },
              ),
              ListTile(
                title: Text(AGENDA),
                leading: Icon(Icons.format_list_bulleted),
                onTap: () {
                  _selectedIndex = 1;
                  _onItemTapped(_selectedIndex);
                  Navigator.pop(context);
                  // ...
                },
              ),
              // ListTile(
              //   title: Text(POSTERS),
              //   leading: Icon(Icons.assignment),
              //   onTap: () {
              //     _selectedIndex = 2;
              //     _onItemTapped(_selectedIndex);
              //     Navigator.pop(context);
              //     // ...
              //   },
              // ),
              ListTile(
                title: Text(SOCIAL),
                leading: Icon(CupertinoIcons.conversation_bubble),
                onTap: () {
                  _selectedIndex = 2; //todo put 3 when posters are back
                  _onItemTapped(_selectedIndex);
                  Navigator.pop(context);
                  // ...
                },
              ),
            ],
          ),
        ),
      appBar: AppBar(
          title: const Text('EMOP 2021 | Belgrade'),
          backgroundColor: Colors.lightGreen[600],
          //todo see with Jelena if this should be black
          // actionsIconTheme: IconThemeData(
          //     size: 30.0,
          //     color: Colors.black,
          //     opacity: 10.0
          // ),
          actions: <Widget>[
            getFavoritesWidget()
          ]),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(HOME),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            title: Text(AGENDA),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.assignment),
          //   title: Text(POSTERS),
          // ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.conversation_bubble),
            title: Text(SOCIAL),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen[600],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget getFavoritesWidget() {
    Widget favoriteWidget = Container();
    if (_selectedIndex == 1)  { //todo add posters index here
      favoriteWidget = Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _favoritesSelected = !_favoritesSelected;
                _agendaPage.updateFavoritesState(_favoritesSelected);
              });
            },
            child: Icon(
              _favoritesSelected ? Icons.favorite : Icons.favorite_border,
              size: 26.0,
            ),
          ));
    }
    return favoriteWidget;
  }
}
