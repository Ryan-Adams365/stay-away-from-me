import 'dart:math';
import 'package:flutter/material.dart';
import 'package:stay_away_from_me/functions/functions.dart';
import 'package:stay_away_from_me/models/translations.dart';
import 'package:stay_away_from_me/widgets/progress.dart';

class ProximityDisplay extends StatefulWidget {
  @override
  _ProximityDisplayState createState() => _ProximityDisplayState();
}

class _ProximityDisplayState extends State<ProximityDisplay> {

  Stream<double> stream = Stream<double>.periodic(Duration(seconds: 1), randValue);

  @override
  Widget build(BuildContext context) {
    
    final Translations translations = Translations(locale: Localizations.localeOf(context));

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${getNumNearbyDevices()} ${translations.getTranslation('nearDevs')}', textScaleFactor: 1.5),

          Padding(
            padding: EdgeInsets.all(getPaddingAmount(context, 0.01, false))
          ),
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 0.6,
              heightFactor: 0.7,
              child: StreamBuilder(
                stream: stream,
                initialData: 0.0,
                builder: (context, snapshot) {
                  
                  if(hasErrors(snapshot)){
                    return Center(child: CircularProgressIndicator(),);
                  }                  
                  return Progress(parentSnapshot: snapshot);
                },
              )
            )
          )
        ],
      )
    );
  }
}

double randValue(int x){
  return Random().nextDouble();
}

bool hasErrors(AsyncSnapshot<double> snapshot) => snapshot.hasError ? true : false;
