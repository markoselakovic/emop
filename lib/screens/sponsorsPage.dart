import 'package:emop/util/utils.dart';
import 'package:flutter/material.dart';

class SponsorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[600],
        title: Text('Sponsors'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            getHeaderTitleWidget("Supporters"),
            getSponsorWidget('assets/beograd.png', 'https://www.beograd.rs/'),
            getSponsorWidget('assets/ministryOfEducation.jpeg',
                'http://www.mpn.gov.rs/?lng=lat'),
            getSponsorWidget('assets/imi.jpeg', 'http://www.imi.bg.ac.rs/eng'),
            getSponsorWidget(
                'assets/Logo_EVPC.jpeg', 'https://ebvs.eu/colleges/EVPC'),
            getHeaderTitleWidget("Sponsors"),
            getSponsorHeaderWidget("Silver", Colors.grey),
            getSponsorWidget('assets/BI_Logo_Black.png',
                'https://www.boehringer-ingelheim.com/'),
            getSponsorHeaderWidget("Bronze", Colors.brown),
            getSponsorWidget(
                'assets/Elsevier_logo.png', 'https://www.elsevier.com/'),
            getDivider(),
            getSponsorWidget('assets/virbac.jpeg',
                'https://corporate.virbac.com/home/discover-virbac/virbac-worldwide.html'),
            getSponsorWidget(
                'assets/BioMerieux_logo.png', 'https://www.biomerieux.com/'),
            getSponsorWidget(
                'assets/ldbio.png', 'http://www.ldbiodiagnostics.com/'),
            getHeaderTitleWidget("Media Partners"),
            getSponsorWidget('assets/malaria_logo.png',
                'https://www.globalcause.co.uk/campaign/malaria/'),
            getSponsorWidget('assets/NTD.png',
                'https://www.globalcause.co.uk/campaign/neglected-tropical-diseases/'),
            getSponsorWidget(
                'assets/parasite.jpeg', 'https://www.parasite-journal.org/'),
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
              style: TextStyle(fontSize: 24, color: Colors.white)),
        ),
      ),
    ]);
  }

  Widget getSponsorHeaderWidget(String text, Color color) {
    return Row(children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          color: color,
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
    ]);
  }

  Widget getSponsorWidget(String asset, url) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Expanded(
        child: Container(
          constraints: BoxConstraints(maxWidth: 100, maxHeight: 140),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: InkWell(
              onTap: () {
                launchURL(url);
              },
              child: Image.asset(asset)),
        ),
      ),
    ]);
  }

  Widget getDivider() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.lightBlue,
        height: 8,
      ),
    );
  }
}
