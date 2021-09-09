import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialPage extends StatelessWidget {

  final Color color = Colors.lightGreen[200];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
      children: <Widget>[
          Container(
            height: 60,
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Spacer(),
                InkWell(
                    onTap: () {
                      _launchURL("https://www.facebook.com/EMOP2020");
                    },
                    child: Image.asset('assets/FB.png')),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: InkWell(onTap: () {
                    _launchURL("https://www.instagram.com/emop_2020/");
                  }
                  ,child: Image.asset('assets/INST.png')),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                  height: 60, padding: EdgeInsets.only(bottom: 10, top: 20),
                  child: InkWell(
                      onTap: () {
                    _launchURL("https://emop2020.org/social-programme/");
                  },
                  child: Image.asset('assets/SOCIAL.png'))),
              Spacer()
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only( bottom: 2.0, top: 10),
                        child: Text("Wednesday / October 13th", textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontFamily: "SinkinSans")),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: color,
                        child: Container(
                          padding: const EdgeInsets.only( bottom: 2.0, top: 3.0),
                          child: Text("Traditional Serbian Dinner",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontFamily: "SinkinSans")),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.only( bottom: 2.0, top:3.0),
                          child: Text("Thursday / October 14th",textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontFamily: "SinkinSans"))),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: color,
                        child: Container(
                          padding: const EdgeInsets.only( bottom: 2.0, top: 3.0),
                          child: Text("Belgrade Cruise & Dinner",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontFamily: "SinkinSans")),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.only( bottom: 2.0, top: 3.0),
                          child: Text("Friday / October 15th", textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontFamily: "SinkinSans"))),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: color,
                        child: Container(
                          padding: const EdgeInsets.only( bottom: 2.0, top: 3.0),
                          child: Text("Farewell Cocktail Party",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontFamily: "SinkinSans")),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ),

          Row(
            children: <Widget>[
              Container(
                  height: 70, padding: EdgeInsets.only(bottom: 10, top: 30), child: InkWell(
                onTap: () {
                  _launchURL("https://emop2020.org/pre-post-congress-tours/");
                },
                  child: Image.asset('assets/tours.png'))),
              Spacer()
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 10, top: 15, bottom: 15),
                    color: color,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: Row(
                            children: <Widget>[
                              Spacer(),
                              Text("1 DAY TOURS:",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: "SinkinSans")),
                            ],
                          ),
                        ),
                        getDescriptionRowText("Monday October 11th", fontSize: 12.0, italic: true),
                        getDescriptionRowText("Vojvodina Tour"),
                        getDescriptionRowText("Tuesday October 12th", fontSize: 12.0, italic: true),
                        getDescriptionRowText("Explore Belgrade"),
                        getDescriptionRowText("Sunday October 17th", fontSize: 12.0, italic: true),
                        getDescriptionRowText("The Ilic-Nijemčevic Winery"),
                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 2.0, top: 15),
                        //   child: Row(
                        //     children: <Widget>[
                        //       Spacer(),
                        //       Text("2 DAY TOURS:",
                        //           textAlign: TextAlign.right,
                        //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: "SinkinSans")),
                        //     ],
                        //   ),
                        // ),
                        // getDescriptionRowText("Sunday August 23rd & Monday August 24th", fontSize: 12.0, italic: true),
                        // getDescriptionRowText("Magical Easern Serbia"),
                      ],
                    )
                  ),
                ),
              ],
            ),
          )
      ],
    ),
        ));
  }


  Widget getDescriptionRowText(String text, {double fontSize = 13.0, bool italic = false}) {
    return Row(
      children: <Widget>[
        Spacer(),
        Text(text,
            textAlign: TextAlign.right,
            softWrap: false,
            style: TextStyle(fontSize: fontSize, fontFamily: "SinkinSans", fontStyle: italic ? FontStyle.italic:  FontStyle.normal)),
      ],
    );
  }

  _launchURL(String url) async {

    if (await canLaunch(url)) {
      await launch(url);
    } else {
//      throw 'Could not launch $url';
    }
  }
}
