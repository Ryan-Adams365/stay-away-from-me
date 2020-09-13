import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:stay_away_from_me/functions/functions.dart';
import 'package:stay_away_from_me/models/device.dart';
import 'package:stay_away_from_me/models/translations.dart';
import 'package:stay_away_from_me/widgets/progress.dart';

class ProximityDisplay extends StatefulWidget {
  
  Stream<ScanResult> results;
  ProximityDisplay({this.results});

  @override
  _ProximityDisplayState createState() => _ProximityDisplayState();
}

class _ProximityDisplayState extends State<ProximityDisplay> {

  @override
  Widget build(BuildContext context) {
    
    final Translations translations = Translations(locale: Localizations.localeOf(context));
    Stream<ScanResult> results = widget.results;
    List<Device> deviceList =[];

    return Center(
      child: StreamBuilder<ScanResult>(
        stream: results,
        builder: (context, snapshot) {
          
          if(snapshot.hasError || !(snapshot.hasData)){

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.all(getPaddingAmount(context, 0.01, false))
                  ),
                  !(snapshot.hasData) ? Text(translations.getTranslation('scanning'), textScaleFactor: 1.5) : Text(translations.getTranslation('errorScanning'), textScaleFactor: 1.5)
                ],
              )
            );
          } 
          deviceList.add(new Device(snapshot.data.rssi));
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${deviceList.length} ${translations.getTranslation('nearDevs')}', textScaleFactor: 1.5),
              Padding(
                padding: EdgeInsets.all(getPaddingAmount(context, 0.01, false))
              ),
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  heightFactor: 0.7,
                  child: Text('TESTING') //Progress(deviceList: deviceList)
                )
              )
            ]
          );
        }
      )
    );
  }
}
