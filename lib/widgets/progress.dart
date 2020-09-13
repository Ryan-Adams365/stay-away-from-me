import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:vibrate/vibrate.dart';
import 'package:stay_away_from_me/functions/functions.dart';
import 'package:stay_away_from_me/models/device.dart';
import 'package:stay_away_from_me/models/translations.dart';


class Progress extends StatelessWidget {
  bool usingMetric = false;
  final List<Device> deviceList;

  Progress({this.deviceList});
  
  @override
  Widget build(BuildContext context) {

    final Translations translations = Translations(locale: Localizations.localeOf(context));
    final double minDistance = getMinDistance(deviceList);

    final double signalStrength = convertDistToStrength(minDistance, 1.83, 6);
    double maxRssi = -999;
    deviceList.forEach((element) {
      if (element.rssiAvg > maxRssi) {
        maxRssi = element.rssiAvg.toDouble();
      }
    });
    vibrateIfClose(minDistance);
    return LiquidLinearProgressIndicator(
      value: signalStrength, 
      valueColor: AlwaysStoppedAnimation(colorMap(signalStrength)),
      backgroundColor: Colors.black, 
      borderColor: Colors.black,
      borderWidth: 1.0,
      borderRadius: 12.0,
      direction: Axis.vertical, 
      center: deviceList.isNotEmpty ? distanceText(translations, maxRssi, usingMetric) : Text(translations.getTranslation('scanning'), textScaleFactor: 1.2,),
    );
  }
}

Color colorMap(double signalStrength){
  if(signalStrength <= 0.2)
      return Colors.blue;
  if(signalStrength <= 0.5)
    return Colors.green;
  if(signalStrength <= 0.7)
    return Colors.orange;
  else
    return Colors.red;
}

double getMinDistance(List<Device> deviceList){
  var minDistance = 999.9;
  deviceList.forEach((device) {
    if(device.rssiAvg != null) {
      var deviceDistance = convertToDistance(device.rssiAvg);
      if (deviceDistance < minDistance) {
        minDistance = deviceDistance;
      }
    }
  });
  return minDistance;
}

void vibrateIfClose(double signalStrength) async {
  if(signalStrength >= 0.7){
    bool canVibrate = await Vibrate.canVibrate;
    if(canVibrate){
       if(signalStrength >= 0.8){        
         final Iterable<Duration> pauses = [
            const Duration(milliseconds: 500),
            const Duration(milliseconds: 1000),
            const Duration(milliseconds: 500),
        ];
        Vibrate.vibrateWithPauses(pauses);
      } else if (signalStrength >= 0.7){
        Vibrate.vibrate();
      }
    }
  }
}

Text distanceText(Translations translations, double distance, bool usingMetric){
  if(usingMetric){
    return Text(
      "${translations.getTranslation('distance')} ${distance.toStringAsFixed(2)} ${translations.getTranslation('meters')}",
      textScaleFactor: 1.2
    );
  }
  return Text(
    "Distance ${metersToFt(distance).toStringAsFixed(2)} ft",
    textScaleFactor: 1.2
  );
}