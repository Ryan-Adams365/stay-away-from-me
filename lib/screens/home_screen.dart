import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          child: Text(decideButtonText(isScanning, translations), textScaleFactor: 1.3,),
          onPressed: () {
            setState( () {
              isScanning = toggleScan(isScanning);
            });
          }
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: EdgeInsets.only(left: getPaddingAmount(context, 0.05, true), right: getPaddingAmount(context, 0.05, true)),
        child: isScanning ? ProximityDisplay() : Prompt(),
      )
    ); 
  }
}

String decideButtonText(bool isScanning, Translations translations) 
  => isScanning ? translations.getTranslation('stop') : translations.getTranslation('scan');
bool toggleScan(bool isScanning) => isScanning ? false : true; 