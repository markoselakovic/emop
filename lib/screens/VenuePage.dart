import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class VenueInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightGreen[600],
            bottom: TabBar(
              tabs: [
                Tab(text: "INFO"),
                Tab(text: "FLOOR PLAN"),
                Tab(text: "AREA"),
              ],
            ),
            title: Text('Venue information'),
          ),
          body: TabBarView(
            children: [
              getInfo(context),
              Image.asset('assets/EMOP2.jpeg'),
              Image.asset('assets/EMOP1.jpeg'),
            ],
          ),
        ),
      ),
    );
  }

  Widget getInfo(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.55;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(
            "EMOP 2021 will take place in the Crowne Plaza Belgrade, ideally located in the central business district of New Belgrade. "
            "Only 13 km from the International Belgrade Airport Nikola Tesla and only 5 minute drive away from the city centre. With 12 distinct function rooms,"
            " a total of 1.300 sqm/ 14.000 sqft flexible meeting space, the hotel has the largest event capacity in Serbia for important corporate functions or memorable social events."
            "\n\nSpecial needs: Wheelchair accessible rooms available and wheelchair accessible parking spaces, lift access to all floors including conference rooms floor, lift near accessible rooms.",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(top: 16.0),
                  width: c_width,
                  child: Text(
                    "Crowne Plaza Belgrade \nVladimira Popovica 10 \n11070 Belgrade, Serbia",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 30),
              Spacer(),
              RaisedButton(
                onPressed: () {
                  MapsLauncher.launchQuery('Crowne Plaza Belgrade, Vladimira Popovića, Belgrade');
                },
                color: Colors.lightGreen[600],
                child: Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    'SHOW ON \nMAP',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset('assets/plaza.jpg'),
          ),
        ],
      ),
    );
  }
}