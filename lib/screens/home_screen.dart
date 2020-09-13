import 'package:flutter/material.dart';
import 'package:beacon_broadcast/beacon_broadcast.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:stay_away_from_me/functions/functions.dart';
import 'package:stay_away_from_me/models/translations.dart';
import 'package:stay_away_from_me/widgets/prompt.dart';
import 'package:stay_away_from_me/widgets/proximity_display.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isScanning = false;

  @override
  Widget build(BuildContext context) {
    final Translations translations = Translations(locale: Localizations.localeOf(context));

    final String title = translations.getTranslation('appTitle');
    FlutterBlue flutterBlue = FlutterBlue.instance;
    BeaconBroadcast beaconBroadcast = BeaconBroadcast();

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
                decideButtonText(isScanning, translations),
                textScaleFactor: 1.3,
              ),
              onPressed: () {
                setState(() {
                  isScanning = toggleScan(isScanning, flutterBlue, beaconBroadcast);
                });
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: EdgeInsets.only(
              left: getPaddingAmount(context, 0.05, true),
              right: getPaddingAmount(context, 0.05, true)),
          child: isScanning ? ProximityDisplay(results: flutterBlue.scanResults) : Prompt(),
        ));
  }
}


String decideButtonText(bool isScanning, Translations translations) 
  => isScanning ? translations.getTranslation('stop') : translations.getTranslation('scan');

bool toggleScan(bool isScanning, FlutterBlue flutterBlue, BeaconBroadcast beaconBroadcast){
  if(isScanning){
    beaconBroadcast.stop();
    flutterBlue.stopScan();
    return false;
  }
  beaconBroadcast
    .setUUID('39ED98FF-2900-441A-802F-9C398FC199D2')
    .setMajorId(1)
    .setMinorId(100)
    .start();
  flutterBlue.startScan(timeout: Duration(seconds: 4));
  return true;
} 