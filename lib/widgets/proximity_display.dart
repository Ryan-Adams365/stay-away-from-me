import 'dart:math';
import 'package:flutter/material.dart';
import 'package:stay_away_from_me/functions/functions.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class ProximityDisplay extends StatefulWidget {
  @override
  _ProximityDisplayState createState() => _ProximityDisplayState();
}

class _ProximityDisplayState extends State<ProximityDisplay> {
  static final int count = 0;

  Stream<double> stream = Stream<double>.periodic(Duration(seconds: 1), randValue);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$count Nearby Devices', textScaleFactor: 1.5),
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
                  double signalStrength;
                  if(snapshot.hasData)
                    signalStrength = snapshot.data;
                  else 
                    signalStrength = 0;
                  return LiquidLinearProgressIndicator(
                    value: signalStrength, 
                    valueColor: AlwaysStoppedAnimation(colorMap(signalStrength)),
                    backgroundColor: Colors.black, 
                    borderColor: Colors.black,
                    borderWidth: 1.0,
                    borderRadius: 12.0,
                    direction: Axis.vertical, 
                    center: Text("Distance x meters"),
                  );
                },
              )
            )
          )
        ] ,
      )
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

double randValue(int x){
  return Random().nextDouble();
}