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

  Stream<List<ScanResult>> _results;

  @override
  void initState() {
    super.initState();
    FlutterBlue.instance.scan(timeout: Duration(seconds: 2));
    _results = FlutterBlue.instance.scanResults;
  }

  @override
  Widget build(BuildContext context) {
    
    final Translations translations = Translations(locale: Localizations.localeOf(context));
    FlutterBlue.instance.startScan(timeout:Duration(seconds: 2)).then((results) {
      setState() {
        _results = FlutterBlue.instance.scanResults;
      }
    });

    return Center(
      child: StreamBuilder<List<ScanResult>>(
        stream: _results,
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
          final List<ScanResult> filteredResults = filterResults(snapshot.data);
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
                  child: Progress(deviceList: filteredResults)
                )
              )
            ]
          );
        }
      )
    );
  }
}

List<ScanResult> filterResults(List<ScanResult> results) {
  List<ScanResult> filteredResults = [];
  final String filterKey = 'iPhone';

  results.forEach((element) {
    if (element.advertisementData.connectable) {
      element.device.connect();
      element.device.disconnect();
      if (element.device.name.contains(filterKey)) {
        filteredResults.add(element);
      }
    }
  });

  return filteredResults;
}