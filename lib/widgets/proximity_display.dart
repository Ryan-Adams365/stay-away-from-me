import 'package:flutter/material.dart';
import 'package:stay_away_from_me/functions/functions.dart';

class ProximityDisplay extends StatelessWidget {
  
  static final int count = 0;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$count Nearby Devices', textScaleFactor: 1.5),
        Padding(
          padding: EdgeInsets.all(getPaddingAmount(context, 0.01, false))
        ),
        Flexible(
          child: FractionallySizedBox(
            widthFactor: 1.0,
            heightFactor: 0.8,
            child: Placeholder(),
          ),
        )
      ],
    );
  }
}