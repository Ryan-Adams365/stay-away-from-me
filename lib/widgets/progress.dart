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
    if(deviceList.isEmpty){
      return Center(child: CircularProgressIndicator());
    } 

    final Translations translations = Translations(locale: Localizations.localeOf(context));
    final double minDistance = getMinDistance(deviceList);
    vibrateIfClose(minDistance);
    return LiquidLinearProgressIndicator(
      value: minDistance, 
      valueColor: AlwaysStoppedAnimation(colorMap(minDistance)),
      backgroundColor: Colors.black, 
      borderColor: Colors.black,
      borderWidth: 1.0,
      borderRadius: 12.0,
      direction: Axis.vertical, 
      center: Text(
        "${translations.getTranslation('distance')} ${minDistance.toStringAsFixed(2)} ${translations.getTranslation('meters')}"
      ),
    );
  }
}

Color colorMap(double distance){
  if(distance > 3)
    return Colors.blue;
  else if(distance >= 2)
    return Colors.green;
  else if(distance >= 1)
    return Colors.orange;
  else
    return Colors.red;
}

double getMinDistance(List<ScanResult> deviceList){
  var minDistance = 999.9;
  deviceList.forEach((device) {
    if(device.rssi != null) {
      var deviceDistance = convertToDistance(device.rssi);
      if (deviceDistance < minDistance) {
        minDistance = deviceDistance;
      }
    }
  });
  return minDistance;
}

void vibrateIfClose(double distance) async {
  if(distance < 2){
    bool canVibrate = await Vibrate.canVibrate;
    if(canVibrate){
      if(distance >= 1){
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