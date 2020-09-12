import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:vibrate/vibrate.dart';
import 'package:stay_away_from_me/functions/functions.dart';
import 'package:stay_away_from_me/models/translations.dart';


class Progress extends StatelessWidget {
  
  final List<ScanResult> deviceList;

  Progress({this.deviceList});
  
  @override
  Widget build(BuildContext context) {

    final Translations translations = Translations(locale: Localizations.localeOf(context));

    final double closestDistance = getClosestDistance(deviceList);
    vibrateIfClose(closestDistance);
    return LiquidLinearProgressIndicator(
      value: closestDistance, 
      valueColor: AlwaysStoppedAnimation(colorMap(closestDistance)),
      backgroundColor: Colors.black, 
      borderColor: Colors.black,
      borderWidth: 1.0,
      borderRadius: 12.0,
      direction: Axis.vertical, 
      center: Text(
        "${translations.getTranslation('distance')} $closestDistance ${translations.getTranslation('meters')}"
      ),
    );
  }
}

Color colorMap(double value){
  if(value <= 0.2)
    return Colors.blue;
  else if(value <= 0.5)
    return Colors.green;
  else if(value <= 0.8)
    return Colors.orange;
  else
    return Colors.red;
}

double getClosestDistance(List<ScanResult> deviceList){
  if (deviceList.isNotEmpty){
    var closestDistance = 999.9;
    deviceList.forEach((device) {
      var deviceDistance = convertToDistance(device.advertisementData.txPowerLevel);
      if (deviceDistance < closestDistance) {
        closestDistance = deviceDistance;
      }
    });
    return closestDistance;
  }
  return 0.0;
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
      } else {
        Vibrate.vibrate();
      }
    }
  }
}