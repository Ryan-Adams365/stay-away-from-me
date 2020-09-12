import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:stay_away_from_me/functions/functions.dart';
import 'package:stay_away_from_me/models/translations.dart';
import 'package:stay_away_from_me/widgets/progress.dart';

class ProximityDisplay extends StatefulWidget {
  @override
  _ProximityDisplayState createState() => _ProximityDisplayState();
}

class _ProximityDisplayState extends State<ProximityDisplay> {

  @override
  Widget build(BuildContext context) {
    
    final Translations translations = Translations(locale: Localizations.localeOf(context));
    FlutterBlue flutterBlue = FlutterBlue.instance;

    flutterBlue.startScan(timeout: Duration(seconds: 4));
        // flutterBlue.startScan(timeout: Duration(minutes: 1));

    return Center(
      child: StreamBuilder<List<ScanResult>>(
        stream: flutterBlue.scanResults,
        builder: (context, snapshot) {
          if(snapshot.hasError || !(snapshot.hasData)){
            return Center(child: CircularProgressIndicator());
          } 
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${snapshot.data.length} ${translations.getTranslation('nearDevs')}', textScaleFactor: 1.5),
              Padding(
                padding: EdgeInsets.all(getPaddingAmount(context, 0.01, false))
              ),
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  heightFactor: 0.7,
                  child: Progress(deviceList: snapshot.data)
                )
              )
            ]
          );
        }
      )
    );
  }
}
