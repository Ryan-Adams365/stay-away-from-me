import 'package:flutter/material.dart';
import 'package:stay_away_from_me/functions/functions.dart';

class HomeScreen extends StatelessWidget {
  
  static final int count = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getPaddingAmount(context, 0.05), right: getPaddingAmount(context, 0.05)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${count} Nearby Devices', textScaleFactor: 1.5),
          Padding(
            padding: EdgeInsets.all(10)
          ),
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 1.0,
              heightFactor: 0.8,
              child: Placeholder(),
              ),
            )

        ],
      ),
    );
  }
}

