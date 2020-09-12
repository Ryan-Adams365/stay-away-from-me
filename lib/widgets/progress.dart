import 'package:flutter/material.dart';
import 'package:stay_away_from_me/functions/functions.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';


class Progress extends StatelessWidget {
  
  final AsyncSnapshot<double> parentSnapshot;

  Progress({this.parentSnapshot});
  
  @override
  Widget build(BuildContext context) {
    final double signalStrength = getSnapshotData(parentSnapshot);

    return LiquidLinearProgressIndicator(
      value: signalStrength, 
      valueColor: AlwaysStoppedAnimation(colorMap(signalStrength)),
      backgroundColor: Colors.black, 
      borderColor: Colors.black,
      borderWidth: 1.0,
      borderRadius: 12.0,
      direction: Axis.vertical, 
      center: Text("Distance ${convertToDistance(parentSnapshot.data)} meters"),
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

double getSnapshotData(AsyncSnapshot<double> snapshot){
  if(snapshot.hasData){
    return snapshot.data;
  }
  return 0.0;
}