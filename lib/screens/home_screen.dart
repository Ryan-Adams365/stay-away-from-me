import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stay_away_from_me/functions/functions.dart';
import 'package:stay_away_from_me/models/translations.dart';
import 'package:stay_away_from_me/widgets/prompt.dart';
import 'package:stay_away_from_me/widgets/proximity_display.dart';

class HomeScreen extends StatefulWidget {
  
  final SharedPreferences preferences;

  HomeScreen({Key key, @required this.preferences}) : super (key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static const String METRIC_KEY = 'usingMetric';
  bool isScanning = false;

  bool get metricMode => widget.preferences.getBool(METRIC_KEY) ?? true;

  void toggleMetric(bool val){  
    setState(() {
      widget.preferences.setBool(METRIC_KEY, val);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Translations translations = Translations(locale: Localizations.localeOf(context));

    final String title = translations.getTranslation('appTitle');
    FlutterBlue flutterBlue = FlutterBlue.instance;
    
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
                  isScanning = toggleScan(isScanning, flutterBlue);
                });
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: EdgeInsets.only(
              left: getPaddingAmount(context, 0.05, true),
              right: getPaddingAmount(context, 0.05, true)),
          child: isScanning ? ProximityDisplay(results: flutterBlue.scan(allowDuplicates: true)) : Prompt(),
        ));
  }
}

String decideButtonText(bool isScanning, Translations translations) 
  => isScanning ? translations.getTranslation('stop') : translations.getTranslation('scan');

bool toggleScan(bool isScanning, FlutterBlue flutterBlue){
  if(isScanning){
    flutterBlue.stopScan();
    return false;
  } 
  return true;
} 