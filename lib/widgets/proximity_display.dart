import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:stay_away_from_me/functions/functions.dart';
import 'package:stay_away_from_me/models/translations.dart';
import 'package:stay_away_from_me/widgets/progress.dart';

class ProximityDisplay extends StatefulWidget {
  
  Stream<List<ScanResult>> results;
  ProximityDisplay({this.results});

  @override
  _ProximityDisplayState createState() => _ProximityDisplayState();
}

class _ProximityDisplayState extends State<ProximityDisplay> {

  @override
  Widget build(BuildContext context) {
    
    final Translations translations = Translations(locale: Localizations.localeOf(context));
    Stream<List<ScanResult>> results = widget.results;

    return Center(
      child: StreamBuilder<List<ScanResult>>(
        stream: results,
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
