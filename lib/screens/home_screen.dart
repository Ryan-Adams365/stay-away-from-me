import 'package:flutter/material.dart';
import 'package:stay_away_from_me/functions/functions.dart';
import 'package:stay_away_from_me/widgets/prompt.dart';
import 'package:stay_away_from_me/widgets/proximity_display.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final String title = 'Stay Away From Me';

  bool isScanning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset('assets/images/safmpng.png'),
          ),
          title: Text(title),
          centerTitle: true,
        ),
        floatingActionButton: SizedBox(
          width: 80,
          height: 80,
          child: FloatingActionButton(
              child: Text(
                decideButtonText(isScanning),
                textScaleFactor: 1.3,
              ),
              onPressed: () {
                setState(() {
                  isScanning = toggleScan(isScanning);
                });
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: EdgeInsets.only(
              left: getPaddingAmount(context, 0.05, true),
              right: getPaddingAmount(context, 0.05, true)),
          child: isScanning ? ProximityDisplay() : Prompt(),
        ));
  }
}

String decideButtonText(bool isScanning) => isScanning ? 'Stop' : 'Scan';
bool toggleScan(bool isScanning) => isScanning ? false : true;
