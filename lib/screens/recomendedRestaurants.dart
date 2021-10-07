import 'package:flutter/material.dart';

class RecommendedRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[600],
        title: Text('Restaurants in Belgrade'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            getHeaderTitleWidget("Our Recommendation"),
            Container(height: 10),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                getTextBox("Buena Vida", 18, Colors.blue[800]),
                getTextBox("Modern Mexican in New Belgrade", 12, Colors.lightBlue),
                Container(height: 10),
                getTextBox("Manufaktura", 18, Colors.blue[800]),
                getTextBox("Modern Serbian in the city center ", 12, Colors.lightBlue),
                Container(height: 10),
                getTextBox("Mama’s bistro", 18, Colors.blue[800]),
                getTextBox("Mediteranean in the city center", 12, Colors.lightBlue),
                Container(height: 10),
                getTextBox("Ambar", 18, Colors.blue[800]),
                getTextBox("Modern Serbian on the river in Beton hala", 12, Colors.lightBlue),
                Container(height: 10),
                getTextBox("Dva Jelena ", 18, Colors.blue[800]),
                getTextBox("Traditional Serbian in Skadarlija, the bohemian quarter", 12, Colors.lightBlue),

              ],
            ),),
            Container(height: 15),
            getHeaderTitleWidget("If you would like to make a reservation, please ask our team at the Social Program Desk"),
          ],
        ),
      ),
    );
  }

  Widget getHeaderTitleWidget(String text) {
    return Row(children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          color: Colors.lightGreen[600],
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, color: Colors.white)),
        ),
      ),
    ]);
  }

  Widget getTextBox(String text, double textSize, Color color) {
    return Row(children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          color: color,
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: textSize, color: Colors.white)),
        ),
      ),
    ]);
  }
}
