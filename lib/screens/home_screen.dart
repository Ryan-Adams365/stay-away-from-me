import 'package:flutter/material.dart';
import 'package:stay_away_from_me/functions/functions.dart';
import 'package:stay_away_from_me/widgets/proximity_display.dart';

class HomeScreen extends StatelessWidget {
  
  static final int count = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getPaddingAmount(context, 0.05, true), right: getPaddingAmount(context, 0.05, true)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${count} Nearby Devices', textScaleFactor: 1.5),
          Padding(
            padding: EdgeInsets.all(getPaddingAmount(context, 0.01, false))
          ),
          ProximityDisplay(),
        ],
      ),
    );
  }
}

